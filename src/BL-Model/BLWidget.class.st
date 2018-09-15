Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLAction opposite: #caller',
		'#attributes => FMMany type: #BLAttribute opposite: #widget',
		'#page => FMOne type: #BLPhase opposite: #widgets',
		'#realClass',
		'#widgetContainer => FMOne type: #BLUIContainer opposite: #widgets'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLWidget class >> annotation [

	<MSEClass: #Widget super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLWidget class >> generatedSlotNames [
	<generated>
	'BLWidget class>>#generatedSlotNames'.
	^ #(page realClass widgetContainer actions attributes)
]

{ #category : #generator }
BLWidget class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLWidget class >> requirements [

	<generated>
	^ { BLWidget }
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

{ #category : #navigation }
BLWidget >> actionsGroup [

	<generated>
	<navigation: 'Actions'>
	^ MooseGroup
			withAll: (self actions asSet)
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

{ #category : #navigation }
BLWidget >> attributesGroup [

	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup
			withAll: (self attributes asSet)
]

{ #category : #accessing }
BLWidget >> page [

	<generated>
	<container>

	^ page
]

{ #category : #accessing }
BLWidget >> page: anObject [

	<generated>
	page := anObject

]

{ #category : #navigation }
BLWidget >> pageGroup [

	<generated>
	<navigation: 'Page'>
	^ MooseGroup
			with: (self page)
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

{ #category : #navigation }
BLWidget >> widgetContainerGroup [

	<generated>
	<navigation: 'WidgetContainer'>
	^ MooseGroup
			with: (self widgetContainer)
]
