"
I'm a widget which can contain other widget (like a panel, a sub-""web page/window"", a composite button)
"
Class {
	#name : #CSNUIContainer,
	#superclass : #CSNWidget,
	#instVars : [
		'#layout => FMOne type: #CSNLayout opposite: #container',
		'#widgets => FMMany type: #CSNWidget opposite: #widgetContainer'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNUIContainer class >> annotation [

	<MSEClass: #UIContainer super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNUIContainer class >> generatedSlotNames [
	<generated>
	'CSNUIContainer class>>#generatedSlotNames'.
	^ #(layout widgets)
]

{ #category : #generator }
CSNUIContainer class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNUIContainer class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNUIContainer >> layout [

	<generated>
	^ layout
]

{ #category : #accessing }
CSNUIContainer >> layout: anObject [

	<generated>
	layout := anObject

]

{ #category : #navigation }
CSNUIContainer >> layoutGroup [

	<generated>
	<navigation: 'Layout'>
	^ MooseGroup
			with: (self layout)
]

{ #category : #accessing }
CSNUIContainer >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
CSNUIContainer >> widgets: anObject [

	<generated>
	widgets value: anObject

]

{ #category : #navigation }
CSNUIContainer >> widgetsGroup [

	<generated>
	<navigation: 'Widgets'>
	^ MooseGroup
			withAll: (self widgets asSet)
]
