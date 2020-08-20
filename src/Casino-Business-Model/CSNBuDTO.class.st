"
(Data Transfer Object)
I represent any kind of data easy to transfert.
"
Class {
	#name : #CSNBuDTO,
	#superclass : #CSNBuEntity,
	#instVars : [
		'#asKeyInDictionaryTypes => FMMany type: #CSNBuDictionaryType opposite: #key',
		'#asValueInDictionaryTypes => FMMany type: #CSNBuDictionaryType opposite: #value',
		'#inCollectionTypes => FMMany type: #CSNBuCollectionType opposite: #type',
		'#usedInAttributes => FMMany type: #CSNBuAttribute opposite: #attributeType'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuDTO class >> annotation [

	<FMClass: #DTO super: #CSNBuEntity>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNBuDTO >> addAsKeyInDictionaryType: anObject [
	<generated>
	^ self asKeyInDictionaryTypes add: anObject
]

{ #category : #adding }
CSNBuDTO >> addAsValueInDictionaryType: anObject [
	<generated>
	^ self asValueInDictionaryTypes add: anObject
]

{ #category : #adding }
CSNBuDTO >> addInCollectionType: anObject [
	<generated>
	^ self inCollectionTypes add: anObject
]

{ #category : #adding }
CSNBuDTO >> addUsedInAttribute: anObject [
	<generated>
	^ self usedInAttributes add: anObject
]

{ #category : #adding }
CSNBuDTO >> addUsedInService: anObject [
	<generated>
	^ self usedInServices add: anObject
]

{ #category : #accessing }
CSNBuDTO >> asKeyInDictionaryTypes [
	"Relation named: #asKeyInDictionaryTypes type: #CSNBuDictionaryType opposite: #key"

	<generated>
	<derived>
	^ asKeyInDictionaryTypes
]

{ #category : #accessing }
CSNBuDTO >> asKeyInDictionaryTypes: anObject [

	<generated>
	asKeyInDictionaryTypes value: anObject
]

{ #category : #accessing }
CSNBuDTO >> asValueInDictionaryTypes [
	"Relation named: #asValueInDictionaryTypes type: #CSNBuDictionaryType opposite: #value"

	<generated>
	<derived>
	^ asValueInDictionaryTypes
]

{ #category : #accessing }
CSNBuDTO >> asValueInDictionaryTypes: anObject [

	<generated>
	asValueInDictionaryTypes value: anObject
]

{ #category : #accessing }
CSNBuDTO >> inCollectionTypes [
	"Relation named: #inCollectionTypes type: #CSNBuCollectionType opposite: #type"

	<generated>
	<derived>
	^ inCollectionTypes
]

{ #category : #accessing }
CSNBuDTO >> inCollectionTypes: anObject [

	<generated>
	inCollectionTypes value: anObject
]

{ #category : #accessing }
CSNBuDTO >> usedInAttributes [
	"Relation named: #usedInAttributes type: #CSNBuAttribute opposite: #attributeType"

	<generated>
	<derived>
	^ usedInAttributes
]

{ #category : #accessing }
CSNBuDTO >> usedInAttributes: anObject [

	<generated>
	usedInAttributes value: anObject
]

{ #category : #accessing }
CSNBuDTO >> usedInServices [
	"Relation named: #usedInServices type: #CSNServiceAPI opposite: #dataType"

	<generated>
	<derived>
	<FMProperty: #usedInServices type: #CSNServiceAPI opposite: #dataType>
	^ self privateState attributeAt: #usedInServices ifAbsentPut: [ FMMultivalueLink on: self opposite: #dataType: ]
]

{ #category : #accessing }
CSNBuDTO >> usedInServices: anObject [

	<generated>
	self usedInServices value: anObject
]
