Class {
	#name : #BLAttribute,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#attributeValue',
		'#oldClass',
		'#widget => FMOne type: #BLWidget opposite: #attributes'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLAttribute class >> annotation [

	<MSEClass: #Attribute super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLAttribute class >> generatedSlotNames [
	<generated>
	'BLAttribute class>>#generatedSlotNames'.
	^ #(widget oldClass attributeValue)
]

{ #category : #generator }
BLAttribute class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLAttribute class >> requirements [

	<generated>
	^ { BLAttribute }
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
BLAttribute >> oldClass [

	<MSEProperty: #oldClass type: #Object>
	<generated>
	^ oldClass
]

{ #category : #accessing }
BLAttribute >> oldClass: anObject [

	<generated>
	oldClass := anObject

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

{ #category : #navigation }
BLAttribute >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
