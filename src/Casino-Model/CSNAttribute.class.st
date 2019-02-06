"
I represent a characteritic that can be add to a Widget
"
Class {
	#name : #CSNAttribute,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#attributeValue',
		'#oldClass',
		'#widget => FMOne type: #CSNWidget opposite: #attributes'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNAttribute class >> annotation [

	<MSEClass: #Attribute super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNAttribute class >> generatedSlotNames [
	<generated>
	'CSNAttribute class>>#generatedSlotNames'.
	^ #(attributeValue oldClass widget)
]

{ #category : #generator }
CSNAttribute class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNAttribute class >> requirements [

	<generated>
	^ { CSNWidget }
]

{ #category : #accessing }
CSNAttribute >> attributeValue [

	<MSEProperty: #attributeValue type: #String>
	<generated>
	<MSEComment: 'The literal value of the attribute'>
	^ attributeValue
]

{ #category : #accessing }
CSNAttribute >> attributeValue: anObject [

	<generated>
	attributeValue := anObject

]

{ #category : #accessing }
CSNAttribute >> belongsTo [

	<generated>
	^ self widget

]

{ #category : #accessing }
CSNAttribute >> belongsTo: anObject [

	<generated>
	self widget: anObject

]

{ #category : #accessing }
CSNAttribute >> oldClass [

	<MSEProperty: #oldClass type: #Object>
	<generated>
	^ oldClass
]

{ #category : #accessing }
CSNAttribute >> oldClass: anObject [

	<generated>
	oldClass := anObject

]

{ #category : #accessing }
CSNAttribute >> widget [

	<generated>
	<container>

	^ widget
]

{ #category : #accessing }
CSNAttribute >> widget: anObject [

	<generated>
	widget := anObject

]

{ #category : #navigation }
CSNAttribute >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
