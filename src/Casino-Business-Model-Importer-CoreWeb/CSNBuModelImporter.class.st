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
CSNBuModelImporter >> createDefaultDTOEntity [

	^ self factory create: CSNBuDTO
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
		| buAttribute |
		buAttribute := self factory create: CSNBuAttribute.
		buAttribute
			name: attribute name;
			source: attribute;
			comment: (attribute comments
					 ifEmpty: nil
					 ifNotEmpty: [ :comments | comments anyOne ]);
			isFinal: attribute isFinal isNotNil;
			isStatic: attribute isClassSide;
			isTransient: attribute isTransient isNotNil.
		buAttribute attributeType: (attribute declaredType
				 ifNotNil: [ :declaredType | declaredType accept: self ]
				 ifNil: [ self createDefaultDTOEntity ]).
		businessType addAttribute: buAttribute ].
	^ businessType
]

{ #category : #importing }
CSNBuModelImporter >> importCollectionType: aClass [

	aClass arguments ifEmpty: [ ^ self factory create: CSNBuDTO ].
	^ (self factory create: CSNBuCollectionType)
		  type: (aClass arguments anyOne accept: self);
		  yourself
]

{ #category : #importing }
CSNBuModelImporter >> importDictionaryType: aClass [

	| dictionary |
	aClass arguments ifEmpty: [ ^ self factory create: CSNBuDTO ].
	dictionary := self factory create: CSNBuDictionaryType.
	dictionary key: (aClass arguments first accept: self).
	dictionary value: ((aClass arguments asOrderedCollection
			  at: 2
			  ifAbsent: [ aClass arguments first ]) accept: self).
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

{ #category : #initialization }
CSNBuModelImporter >> initialize [
	super initialize.
	factory := CSNBuModelImporterFactory new.
]

{ #category : #visiting }
CSNBuModelImporter >> visitClass: aClass [

	^ (#( Boolean Byte Character Date Double Float Integer Long Short
	      String Void ) includes: aClass name)
		  ifTrue: [ self importPrimitiveType: aClass ]
		  ifFalse: [ 
			  (aClass superclassHierarchy anySatisfy: [ :class | 
				   class name = self dtoAbstractName ])
				  ifTrue: [ self importClass: aClass ]
				  ifFalse: [ self factory create: CSNBuDTO ] ]
]

{ #category : #visiting }
CSNBuModelImporter >> visitEnum: aParameterType [

	self flag: 'Stil not suported'.
	^ self createDefaultDTOEntity
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
	^ self createDefaultDTOEntity
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizableClass: aClass [

	"ParametrizedType but we do not know the parameters..."

	self flag: 'Stil not suported'.
	^ self createDefaultDTOEntity
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizedType: aClass [

	"Probably a complex Type"

	aClass withSuperclassHierarchy do: [ :superclass | 
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
	^ self createDefaultDTOEntity
]
