"
I represent a dictionary of two data type
key: <dataType> value: <dataType>
"
Class {
	#name : #CSNBuDictionaryType,
	#superclass : #CSNBuComplexType,
	#instVars : [
		'#key => FMOne type: #CSNBuDTO opposite: #asKeyInDictionaryTypes',
		'#value => FMOne type: #CSNBuDTO opposite: #asValueInDictionaryTypes'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuDictionaryType class >> annotation [

	<FMClass: #DictionaryType super: #CSNBuComplexType>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBuDictionaryType >> isDictionaryType [

	<generated>
	^ true
]

{ #category : #accessing }
CSNBuDictionaryType >> key [
	"Relation named: #key type: #CSNBuDTO opposite: #asKeyInDictionaryTypes"

	<generated>
	^ key
]

{ #category : #accessing }
CSNBuDictionaryType >> key: anObject [

	<generated>
	key := anObject
]

{ #category : #accessing }
CSNBuDictionaryType >> value [
	"Relation named: #value type: #CSNBuDTO opposite: #asValueInDictionaryTypes"

	<generated>
	^ value
]

{ #category : #accessing }
CSNBuDictionaryType >> value: anObject [

	<generated>
	value := anObject
]
