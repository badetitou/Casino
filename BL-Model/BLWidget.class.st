"
I represent a widget entity
I can be everything in a User Interface (Button/Pannel/Text/Presenter)
"
Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLAction opposite: #caller',
		'#attributes => FMMany type: #BLAttribute opposite: #widget',
		'#constructor',
		'#parameters',
		'#realClass',
		'#variable',
		'#widgetContainer => FMOne type: #BLUIContainer opposite: #widgets'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLWidget class >> annotation [

	<generated>
	<MSEClass: #Widget super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLWidget class >> generatedSlotNames [
	<generated>
	'BLWidget class>>#generatedSlotNames'.
	^ #(actions attributes widgetContainer realClass)
]

{ #category : #generator }
BLWidget class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLWidget class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLWidget >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
BLWidget >> actions: anObject [

	<generated>
	actions value: anObject

]

{ #category : #accessing }
BLWidget >> attributes [

	<generated>
	^ attributes
]

{ #category : #accessing }
BLWidget >> attributes: anObject [

	<generated>
	attributes value: anObject

]

{ #category : #model }
BLWidget >> constructor [
	<MSEProperty: #constructor type: #Object>
	^ constructor
]

{ #category : #model }
BLWidget >> constructor: theFAMIXInvocationOfTheInstanciation [
	constructor := theFAMIXInvocationOfTheInstanciation
]

{ #category : #accessing }
BLWidget >> variable [
	<MSEProperty: #variable type: #Object>
	^ variable
]

{ #category : #accessing }
BLWidget >> variable: anObject [
	variable := anObject
]

{ #category : #accessing }
BLWidget >> widgetContainer [

	<generated>
	<container>

	^ widgetContainer
]

{ #category : #accessing }
BLWidget >> widgetContainer: anObject [

	<generated>
	widgetContainer := anObject

]
