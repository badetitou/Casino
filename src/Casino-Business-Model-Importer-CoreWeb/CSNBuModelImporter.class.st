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

{ #category : #accessing }
CSNBuModelImporter >> dtoAbstractName [
	^ 'AbstractPersistentObjectGWT'
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

{ #category : #visiting }
CSNBuModelImporter >> getDefaultDTOEntity [

	^ (buModel allWithType: CSNBuDTO)
		  ifEmpty: [ self factory create: CSNBuDTO ]
		  ifNotEmpty: [ :dto | dto first ]
]

{ #category : #importing }
CSNBuModelImporter >> import [

	self famixModel allClasses asOrderedCollection
		detect: [ :class | class name = self dtoAbstractName ]
		ifFound: [ :class | 
			class subclassHierarchy
				reject: [ :a | 
				a isStub or: [ a isAbstract isNotNil and: [ a isAbstract ] ] ]
				thenDo: [ :concreteClass | self importClass: concreteClass ] ]
		ifNone: [ Error signal: 'Abstract class not found' ]
]

{ #category : #importing }
CSNBuModelImporter >> importAttribute: anAttribute [

	| declaration declarator buAttribute |
	"Use FAST to handle arrays and the eventual initialization expression"
	declaration := (anAttribute parentType generateFastIfNotDoneAndBind 
		                allWithType: FASTJavaVarDeclStatement) detect: [ 
		               :varDecl | 
		               declarator := varDecl declarators
			                             anyOneIfOnlyOneElement.
		               declarator variable name = anAttribute name ].

	buAttribute := self factory create: CSNBuAttribute.
	buAttribute
		name: anAttribute name;
		source: anAttribute;
		comment: (anAttribute comments
				 ifEmpty: nil
				 ifNotEmpty: [ :comments | comments anyOne ]);
		isFinal: anAttribute isFinal isNotNil;
		isStatic: anAttribute isClassSide;
		isTransient: anAttribute isTransient isNotNil;
		expression: declarator expression;
		attributeType: (anAttribute declaredType
				 ifNotNil: [ :declaredType | self importAttribute: declaredType ]
				 ifNil: [ self getDefaultDTOEntity ]).

	anAttribute declaredType accept: self
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
				                 ifNotEmpty: [ :comments | comments anyOne ]);
		                isAbstract: concreteClass isAbstract isNotNil;
		                yourself.

	"Link with subclasses to preserve the same hierarchy, and they are also DTOs"
	concreteClass directSubclasses do: [ :subclass | 
		(self importClass: subclass) parent: businessType ].

	"Handle attributes, which are also DTOs"
	concreteClass attributes do: [ :attribute | 
		businessType addAttribute: (self importAttribute: attribute) ].
	^ businessType
]

{ #category : #importing }
CSNBuModelImporter >> importCollectionType: aClass [

	^ (self factory create: CSNBuCollectionType)
		  type: (aClass arguments
				   ifEmpty: [ self getDefaultDTOEntity ]
				   ifNotEmpty: [ :arguments | arguments anyOne accept: self ]);
		  yourself
]

{ #category : #importing }
CSNBuModelImporter >> importDictionaryType: aClass [

	| dictionary |
	dictionary := self factory create: CSNBuDictionaryType.
	aClass arguments
		ifEmpty: [ "If parameters are not declared or not found, use defaults"
			dictionary key: self getDefaultDTOEntity.
			dictionary value: self getDefaultDTOEntity ]
		ifNotEmpty: [ :arguments | 
			arguments size = 1
				ifTrue: [ "Key and value are of the same type"
					dictionary key: (arguments first accept: self).
					dictionary value: dictionary key ]
				ifFalse: [ "Hack to export the type parameters in the correct order from source text"
					| source |
					source := aClass typedEntities anyOne sourceText.
					(source
						 includesSubstring: arguments first name
						 at: (source indexOf: $<) + 1)
						ifTrue: [ 
							dictionary key: (arguments first accept: self).
							dictionary value: (arguments second accept: self) ]
						ifFalse: [ 
							dictionary key: (arguments second accept: self).
							dictionary value: (arguments first accept: self) ] ] ].
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
				   ifEmpty: [ self getDefaultDTOEntity ]
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
		 class name = self dtoAbstractName ]) ifTrue: [ 
		^ self importClass: aClass ].
	^ self getDefaultDTOEntity
]

{ #category : #visiting }
CSNBuModelImporter >> visitEnum: aParameterType [

	self flag: 'Stil not suported'.
	^ self getDefaultDTOEntity
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameter: aParameter [

	"in case the declaredType is not extracted because verveineJ has failed (or the class is not present in our model)"

	aParameter declaredType ifNil: [ ^ self factory create: CSNBuDTO ].
	^ aParameter declaredType accept: self
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterType: aParameterType [

	self flag: 'Stil not suported'.
	^ self getDefaultDTOEntity
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizableClass: aClass [

	"ParametrizedType but we do not know the parameters..."

	self flag: 'Stil not suported'.
	^ self getDefaultDTOEntity
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
	^ self factory create: CSNBuDTO
]

{ #category : #visiting }
CSNBuModelImporter >> visitPrimitiveType: aPrimitiveType [

	^ self importPrimitiveType: aPrimitiveType
]

{ #category : #visiting }
CSNBuModelImporter >> visitType: aType [

	self flag: 'Stil not suported'.
	^ self getDefaultDTOEntity
]
