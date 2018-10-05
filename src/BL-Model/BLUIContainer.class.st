Class {
	#name : #BLUIContainer,
	#superclass : #BLWidget,
	#instVars : [
		'#layout => FMOne type: #BLLayout opposite: #container',
		'#widgets => FMMany type: #BLWidget opposite: #widgetContainer'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLUIContainer class >> annotation [

	<MSEClass: #UIContainer super: #BLWidget>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLUIContainer class >> generatedSlotNames [
	<generated>
	'BLUIContainer class>>#generatedSlotNames'.
	^ #(widgets layout)
]

{ #category : #generator }
BLUIContainer class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLUIContainer class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLUIContainer >> layout [

	<generated>
	^ layout
]

{ #category : #accessing }
BLUIContainer >> layout: anObject [

	<generated>
	layout := anObject

]

{ #category : #navigation }
BLUIContainer >> layoutGroup [

	<generated>
	<navigation: 'Layout'>
	^ MooseGroup
			with: (self layout)
]

{ #category : #accessing }
BLUIContainer >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
BLUIContainer >> widgets: anObject [

	<generated>
	widgets value: anObject

]

{ #category : #navigation }
BLUIContainer >> widgetsGroup [

	<generated>
	<navigation: 'Widgets'>
	^ MooseGroup
			withAll: (self widgets asSet)
]
