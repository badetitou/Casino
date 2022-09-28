"
I import DTO from a famix model.

I am a partial visitor of a famix model to help the importation process
"
Class {
	#name : #CSNBuModelImporter,
	#superclass : #Object,
	#instVars : [
		'famixModel',
		'buModel',
		'factory'
	],
	#category : #'Casino-Business-Model-Importer-CoreWeb'
}

{ #category : #accessing }
CSNBuModelImporter >> buModel [
	^ buModel
]

{ #category : #accessing }
CSNBuModelImporter >> buModel: anObject [
	buModel := anObject.
	self factory model: buModel
]

{ #category : #visiting }
CSNBuModelImporter >> buildDefaultDtoFrom: aSource [

	^ (buModel allWithType: CSNBuDTO)
		  detect: [ :bu | bu source = aSource ]
		  ifNone: [ 
			  (self factory create: CSNBuDTO)
				  source: aSource;
				  yourself ]
]

{ #category : #accessing }
CSNBuModelImporter >> dtoAbstractNames [

	^ { 'AbstractPersistentObjectGWT'. 'AbstractEnumDTO' }
]

{ #category : #accessing }
CSNBuModelImporter >> factory [
	^ factory
]

{ #category : #accessing }
CSNBuModelImporter >> famixModel [
	^ famixModel
]

{ #category : #accessing }
CSNBuModelImporter >> famixModel: anObject [
	famixModel := anObject
]

{ #category : #importing }
CSNBuModelImporter >> import [

	self famixModel allClasses asOrderedCollection
		detect: [ :class | self dtoAbstractNames includes: class name  ]
		ifFound: [ :class | 
			class subclassHierarchy
				reject: [ :a | 
				a isStub or: [ a isAbstract isNotNil and: [ a isAbstract ] ] ]
				thenDo: [ :concreteClass | self importClass: concreteClass ] ]
		ifNone: [ Error signal: 'Abstract class not found' ]
]

{ #category : #importing }
CSNBuModelImporter >> importAttribute: anAttribute [

	| declarator buAttribute |
	"Use FAST to handle arrays and the eventual initialization expression"
	declarator := anAttribute parentType sourceAnchor
		              ifNil: [ 
			              ('No sourceAnchor for '
			               , anAttribute parentType fullName) record.
			              nil ]
		              ifNotNil: [ 
			              (anAttribute parentType generateFastIfNotDoneAndBind 
				               allWithType: FASTJavaVariableDeclarator) detect: [ 
				              :varDecl | varDecl variable name = anAttribute name ] ].

	buAttribute := self factory create: CSNBuAttribute.
	buAttribute
		name: anAttribute name;
		source: anAttribute;
		comment: (anAttribute comments
				 ifEmpty: nil
				 ifNotEmpty: [ :comments | comments anyOne sourceText ]);
		isFinal: anAttribute isFinal isNotNil;
		isStatic: anAttribute isClassSide;
		isTransient: anAttribute isTransient isNotNil.
	"TODO: handle expression with behavior model
		expression: (declarator ifNotNil: [ 
					 self importAttributeExpression: declarator expression ])."

	anAttribute declaredType
		ifNil: [ buAttribute attributeType: (self buildDefaultDtoFrom: nil) ]
		ifNotNil: [ :declaredType | 
			| outerType innerType |
			innerType := anAttribute declaredType accept: self.
			declarator ifNotNil: [ "handle eventual arrays, which are a collection type"
				outerType := declarator varDeclOwner type.
				[ outerType class == FASTJavaArrayTypeExpression ] whileTrue: [ 
					outerType := outerType baseType.
					innerType := (self factory create: CSNBuCollectionType) type:
						             innerType ] ].
			buAttribute attributeType: innerType ].

	^ buAttribute
]

{ #category : #importing }
CSNBuModelImporter >> importAttributeExpression: anExpression [

	"Return the attribute's initializion expression, transpiled to typescript if necessary."

	anExpression ifNil: [ ^ nil ].

	anExpression class == FASTJavaNullLiteral ifTrue: [ ^ 'null' ].

	((anExpression class usesTrait: FASTTLiteral) or: [ 
		 anExpression class == FASTJavaStringLiteral or: [ 
			 anExpression class == FASTJavaUnaryExpression ] ]) ifTrue: [ 
		^ anExpression sourceCode ].

	(anExpression class == FASTJavaVariableExpression and: [ 
		 anExpression famixVariable isNotNil ]) ifTrue: [ 
		anExpression famixVariable isClassSide
			ifNil: [ ^ 'this.' , anExpression name ]
			ifNotNil: [ 
				^ anExpression famixVariable parentType name , '.'
				  , anExpression name ] ].

	anExpression class == FASTJavaArrayInitializer ifTrue: [ 
		^ '['
		  ,
			  (', ' join:
				   (anExpression initializers collect: [ :initializer | 
					    self importAttributeExpression: initializer ])) , ']' ].

	anExpression class == FASTJavaNewExpression ifTrue: [ 
		| invoked |
		invoked := anExpression famixInvocation invokedClass.
		(invoked fullName beginsWith: 'java') ifTrue: [ 
			invoked allSuperclassesDo: [ :superclass | 
				superclass name = #Set ifTrue: [ ^ 'new Set()' ].
				superclass name = #Map ifTrue: [ ^ 'new Map()' ].
				superclass name = #Collection ifTrue: [ ^ '[]' ] ] ] ].

	^ 'null /* ' , anExpression sourceCode , ' */'
]

{ #category : #importing }
CSNBuModelImporter >> importClass: concreteClass [

	"Import a new BusinessType DTO"

	| businessType |
	"Does not import already existing BusinessType of the model"
	(self buModel allWithType: CSNBuBusinessType)
		detect: [ :existingBusinessType | 
			existingBusinessType name = concreteClass name ]
		ifFound: [ :existingBusinessType | ^ existingBusinessType ].
	businessType := (self factory create: CSNBuBusinessType)
		                name: concreteClass name;
		                source: concreteClass;
		                comment: (concreteClass comments
				                 ifEmpty: nil
				                 ifNotEmpty: [ :comments | 
					                 comments anyOne sourceText ]);
		                isAbstract: concreteClass isAbstract isNotNil;
		                yourself.

	"Link with subclasses to preserve the same hierarchy, and they are also DTOs"
	concreteClass directSubclasses
		reject: [ :subclass | subclass isAnonymousClass ]
		thenDo: [ :subclass | 
		(self importClass: subclass) parent: businessType ].

	"Handle attributes, which are also DTOs"
	concreteClass attributes do: [ :attribute | 
		businessType addAttribute: (self importAttribute: attribute) ].
	^ businessType
]

{ #category : #importing }
CSNBuModelImporter >> importCollectionType: aClass [

	^ (self factory create: CSNBuCollectionType)
		  source: aClass;
		  type: (aClass arguments
				   ifEmpty: [ self buildDefaultDtoFrom: aClass ]
				   ifNotEmpty: [ :arguments | arguments anyOne accept: self ]);
		  yourself
]

{ #category : #importing }
CSNBuModelImporter >> importDictionaryType: aClass [

	| dictionary |
	dictionary := self factory create: CSNBuDictionaryType.
	dictionary source: aClass.
	aClass arguments
		ifEmpty: [ "If parameters are not declared or not found, use defaults"
			dictionary key: (self buildDefaultDtoFrom: nil).
			dictionary value: (self buildDefaultDtoFrom: nil) ]
		ifNotEmpty: [ :arguments | 
			arguments size = 1
				ifTrue: [ "Key and value are of the same type"
					dictionary key: (arguments first accept: self).
					dictionary value: dictionary key ]
				ifFalse: [ "Hack to export the type parameters in the correct order from source text"
					| source |
					(aClass typedEntities isEmpty and: [ aClass isStub ])
						ifTrue: [ 
							dictionary key: (arguments first accept: self).
							dictionary value: (arguments second accept: self) ]
						ifFalse: [ 
							source := aClass typedEntities anyOne sourceText.
							(source
								 includesSubstring: arguments first name
								 at: (source indexOf: $<) + 1)
								ifTrue: [ 
									dictionary key: (arguments first accept: self).
									dictionary value: (arguments second accept: self) ]
								ifFalse: [ 
									dictionary key: (arguments second accept: self).
									dictionary value: (arguments first accept: self) ] ] ] ].
	^ dictionary
]

{ #category : #importing }
CSNBuModelImporter >> importForServiceApi: aServiceAPI [

	aServiceAPI dataType: (aServiceAPI source declaredType accept: self).
	aServiceAPI parameters do: [ :parameter | 
		parameter dataType: (parameter source accept: self) ]
]

{ #category : #importing }
CSNBuModelImporter >> importPrimitiveType: aClass [

	(self buModel allWithType: CSNBuPrimitive)
		detect: [ :existingPrimitiveType | 
		existingPrimitiveType name = aClass name ]
		ifFound: [ :existingPrimitiveType | ^ existingPrimitiveType ].
	^ (self factory create: CSNBuPrimitive)
		  name: aClass name;
		  yourself
]

{ #category : #visiting }
CSNBuModelImporter >> importSetType: aClass [

	^ (self factory create: CSNBuSetType)
		  type: (aClass arguments
				   ifEmpty: [ self buildDefaultDtoFrom: aClass ]
				   ifNotEmpty: [ :arguments | arguments anyOne accept: self ]);
		  yourself
]

{ #category : #initialization }
CSNBuModelImporter >> initialize [
	super initialize.
	factory := CSNBuModelImporterFactory new.
]

{ #category : #visiting }
CSNBuModelImporter >> visitClass: aClass [

	(#( Boolean Byte Character Date Double Float Integer Long Short String
	    Void ) includes: aClass name) ifTrue: [ 
		^ self importPrimitiveType: aClass ].
	(aClass superclassHierarchy anySatisfy: [ :class | 
		 self dtoAbstractNames includes: class name ]) ifTrue: [ 
		^ self importClass: aClass ].
	^ self buildDefaultDtoFrom: aClass
]

{ #category : #visiting }
CSNBuModelImporter >> visitEnum: aParameterType [

	self flag: 'Stil not suported'.
	^ self buildDefaultDtoFrom: aParameterType
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameter: aParameter [

	"in case the declaredType is not extracted because verveineJ has failed (or the class is not present in our model)"

	aParameter declaredType ifNil: [ ^ self buildDefaultDtoFrom: aParameter ].
	^ aParameter declaredType accept: self
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterType: aParameterType [

	self flag: 'Stil not suported'.
	^ self buildDefaultDtoFrom: aParameterType
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizableClass: aClass [

	"ParametrizedType but we do not know the parameters..."

	self flag: 'Stil not suported'.
	^ self buildDefaultDtoFrom: aClass
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizedType: aClass [

	"Probably a complex Type"

	aClass withSuperclassHierarchy do: [ :superclass | 
		superclass name = #Set ifTrue: [ ^ self importSetType: aClass ].
		superclass name = #Collection ifTrue: [ 
			^ self importCollectionType: aClass ].
		superclass name = #Map ifTrue: [ 
			^ self importDictionaryType: aClass ] ].
	^ self buildDefaultDtoFrom: aClass
]

{ #category : #visiting }
CSNBuModelImporter >> visitPrimitiveType: aPrimitiveType [

	^ self importPrimitiveType: aPrimitiveType
]

{ #category : #visiting }
CSNBuModelImporter >> visitType: aType [

	self flag: 'Stil not suported'.
	^ self buildDefaultDtoFrom: aType
]
