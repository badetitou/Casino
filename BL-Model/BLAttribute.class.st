Class {
	#name : #BLAttribute,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#attributeValue',
		'#widget => FMOne type: #BLWidget opposite: #attributes'
	],
	#category : #'BL-Model-Entities'
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
	'BLAttribute class>>#generatedSlotNames'.
	^ #(widget attributeValue)
]

{ #category : #generator }
BLAttribute class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLAttribute class >> requirements [

	<generated>
	^ {  }
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
BLAttribute >> widget [

	<generated>
	<container>

	^ widget
]

{ #category : #accessing }
BLAttribute >> widget: anObject [

	<generated>
	widget := anObject

]
