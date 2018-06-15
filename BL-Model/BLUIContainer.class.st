Class {
	#name : #BLUIContainer,
	#superclass : #BLWidget,
	#traits : 'BLTWithWidgets',
	#classTraits : 'BLTWithWidgets classTrait',
	#instVars : [
		'#elements'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLUIContainer class >> annotation [

	<generated>
	<MSEClass: #UIContainer super: #BLWidget>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLUIContainer class >> generatedSlotNames [
	<generated>
	'BLUIContainer class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLUIContainer class >> generatedTraitNames [
	<generated>
	^ #(BLTWithWidgets)
]

{ #category : #meta }
BLUIContainer class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLUIContainer >> attributesTag [
	^ ((self attributes groupedBy: [ :attribut | attribut name ])
		associationsCollect: [ :mapAttributeNameValues | 
			' ' , mapAttributeNameValues key asString , '="'
				,
					((mapAttributeNameValues value
						flatCollect: [ :attribute | attribute attributeValue asString , ' ' ]) removeLast; yourself)
				, '"' ]) flatten
]

{ #category : #accessing }
BLUIContainer >> elements [
	^ elements
]

{ #category : #accessing }
BLUIContainer >> elements: anObject [
	elements := anObject
]

{ #category : #navigation }
BLUIContainer >> widgetsGroup [

	<generated>
	<navigation: 'Widgets'>
	^ MooseGroup
			withAll: (self widgets asSet)
]
