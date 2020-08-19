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

{ #category : #importing }
CSNBuModelImporter >> import [
	self famixModel allClasses
		detect: [ :class | class name = self dtoAbstractName ]
		ifFound: [ :class |
			class subclassHierarchy
				reject: [ :a | a isStub or: [ a isAbstract ] ]
				thenDo: [ :concreteClass | self importClass: concreteClass ] ]
		ifNone: [ Error signal: 'Abstract class not found' ]
]

{ #category : #importing }
CSNBuModelImporter >> importClass: concreteClass [
	"Import a new BusinessType DTO"

	| businessType |
	"Does not import already existing BusinessType of the model"
	(self buModel allWithType: CSNBuBusinessType)
		detect: [ :existingBusinessType | existingBusinessType name = concreteClass name ]
		ifFound: [ :existingBusinessType | ^ existingBusinessType ].
	businessType := (self factory create: CSNBuBusinessType)
		name: concreteClass name;
		yourself.

	concreteClass attributes
		do: [ :attribute | 
			| buAttribute |
			buAttribute := self factory create: CSNBuAttribute.
			buAttribute name: attribute name.
			buAttribute attributeType: (attribute declaredType accept: self).
			businessType addAttribute: buAttribute ].
	^ businessType
]

{ #category : #importing }
CSNBuModelImporter >> importCollectionType: aClass [
	^ (self factory create: CSNBuCollectionType)
		type: (aClass arguments anyOne accept: self);
		yourself
]

{ #category : #importing }
CSNBuModelImporter >> importDictionaryType: aClass [
	| dictionary arguments |
	dictionary := self factory create: CSNBuDictionaryType.
	dictionary key: (aClass arguments first accept: self).
	dictionary value: (aClass arguments second accept: self).
	^ dictionary
]

{ #category : #importing }
CSNBuModelImporter >> importPrimitiveType: aClass [
	(self buModel allWithType: CSNBuPrimitive)
		detect: [ :existingPrimitiveType | existingPrimitiveType name = aClass name ]
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
	^ ({'String' . 'Date' . 'Boolean' . 'Integer' . 'Double'} includes: aClass name)
		ifTrue: [ self importPrimitiveType: aClass ]
		ifFalse: [ (aClass superclassHierarchy anySatisfy: [ :class | class name = self dtoAbstractName ])
				ifTrue: [ self importClass: aClass ]
				ifFalse: [ self factory create: CSNBuDTO ] ]
]

{ #category : #visiting }
CSNBuModelImporter >> visitEnum: aParameterType [
	self flag: 'Stil not suported'.
	^ self factory create: CSNBuDTO
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterType: aParameterType [
	self flag: 'Stil not suported'.
	^ self factory create: CSNBuDTO
]

{ #category : #visiting }
CSNBuModelImporter >> visitParameterizedType: aClass [
	"Probably a complex Type"

	^ (aClass withSuperclassHierarchy anySatisfy: [ :superclass | {'List' . 'Set'} includes: superclass name ])
		ifTrue: [ self importCollectionType: aClass ]
		ifFalse: [ (aClass withSuperclassHierarchy anySatisfy: [ :superclass | {'Map'} includes: superclass name ])
				ifTrue: [ self importDictionaryType: aClass ]
				ifFalse: [ self factory create: CSNBuDTO ] ]
]

{ #category : #visiting }
CSNBuModelImporter >> visitPrimitiveType: aPrimitiveType [
	"Probably a complex Type"

	^ self importPrimitiveType: aPrimitiveType
]

{ #category : #visiting }
CSNBuModelImporter >> visitType: aType [
	self flag: 'Stil not suported'.
	^ self factory create: CSNBuDTO
]
