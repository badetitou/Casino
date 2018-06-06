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

{ #category : #model }
BLUIContainer >> addWidget: aWidget [
	widgets add: aWidget
]

{ #category : #accessing }
BLUIContainer >> attributesTag [
	^ self attributes asOrderedCollection
		flatCollect: [ :attribute | ' ' , attribute asString ]
		
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
