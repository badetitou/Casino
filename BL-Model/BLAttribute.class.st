Class {
	#name : #BLAttribute,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTAttribute',
	#classTraits : 'BLTAttribute classTrait',
	#instVars : [
		'#attributeValue'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLAttribute class >> annotation [

	<generated>
	<MSEClass: #Attribute super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLAttribute class >> generatedSlotNames [
	<generated>
	^ #(attributeValue)
]

{ #category : #generator }
BLAttribute class >> generatedTraitNames [
	<generated>
	^ #(BLTAttribute)
]

{ #category : #meta }
BLAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLAttribute >> attributeGroup [

	<generated>
	<navigation: 'Attribute'>
	^ MooseGroup
			with: (self attribute)
]

{ #category : #accessing }
BLAttribute >> attributeValue [

	<MSEProperty: #attributeValue type: #String>
	<generated>
	<MSEComment: 'The literal value of the attribute'>
	^ attributeValue
]

{ #category : #accessing }
BLAttribute >> attributeValue: anObject [

	<generated>
	attributeValue := anObject

]

{ #category : #accessing }
BLAttribute >> behaviors [
	^ Set new
]

{ #category : #accessing }
BLAttribute >> name [
	^ name
]

{ #category : #accessing }
BLAttribute >> name: aString [
	name := aString 
]
