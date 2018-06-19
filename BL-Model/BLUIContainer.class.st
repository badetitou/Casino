Class {
	#name : #BLUIContainer,
	#superclass : #BLWidget,
	#instVars : [
		'#widgets => FMMany type: #BLWidget opposite: #widgetContainer'
	],
	#category : #'BL-Model-Entities'
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
	^ #(widgets)
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
BLUIContainer >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
BLUIContainer >> widgets: anObject [

	<generated>
	widgets value: anObject

]
