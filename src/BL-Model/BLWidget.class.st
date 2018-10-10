Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#realClass',
		'#widgetContainer => FMOne type: #BLUIContainer opposite: #widgets',
		'#actions => FMMany type: #BLAction opposite: #caller',
		'#attributes => FMMany type: #BLAttribute opposite: #widget',
		'#size => FMMany type: #BLSize opposite: #widget',
		'#position => FMMany type: #BLPosition opposite: #widget'
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
	^ #(realClass widgetContainer actions attributes size position)
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
BLWidget >> position [

	<generated>
	^ position
]

{ #category : #accessing }
BLWidget >> position: anObject [

	<generated>
	position value: anObject

]

{ #category : #navigation }
BLWidget >> positionGroup [

	<generated>
	<navigation: 'Position'>
	^ MooseGroup
			withAll: (self position asSet)
]

{ #category : #accessing }
BLWidget >> realClass [

	<MSEProperty: #realClass type: #MooseEntity>
	<generated>
	<MSEComment: 'The type (class) of the widget'>
	^ realClass
]

{ #category : #accessing }
BLWidget >> realClass: anObject [

	<generated>
	realClass := anObject

]

{ #category : #accessing }
BLWidget >> size [

	<generated>
	^ size
]

{ #category : #accessing }
BLWidget >> size: anObject [

	<generated>
	size value: anObject

]

{ #category : #navigation }
BLWidget >> sizeGroup [

	<generated>
	<navigation: 'Size'>
	^ MooseGroup
			withAll: (self size asSet)
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
