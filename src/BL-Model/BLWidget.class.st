"
I'm the main block of the user interface. Everything in a user interface is a widget with attributes
"
Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLAction opposite: #caller',
		'#attributes => FMMany type: #BLAttribute opposite: #widget',
		'#cellOwner => FMOne type: #BLCell opposite: #widget',
		'#position',
		'#realClass',
		'#size',
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
	^ #(actions attributes cellOwner position realClass size widgetContainer)
]

{ #category : #generator }
BLWidget class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLWidget class >> requirements [

	<generated>
	^ { BLUIContainer }
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
BLWidget >> belongsTo [

	<generated>
	^ self widgetContainer

]

{ #category : #accessing }
BLWidget >> belongsTo: anObject [

	<generated>
	self widgetContainer: anObject

]

{ #category : #accessing }
BLWidget >> cellOwner [

	<generated>
	^ cellOwner
]

{ #category : #accessing }
BLWidget >> cellOwner: anObject [

	<generated>
	cellOwner := anObject

]

{ #category : #navigation }
BLWidget >> cellOwnerGroup [

	<generated>
	<navigation: 'CellOwner'>
	^ MooseGroup
			with: (self cellOwner)
]

{ #category : #accessing }
BLWidget >> position [

	<MSEProperty: #position type: #BLPosition>
	<generated>
	<MSEComment: 'The alignement of the widget'>
	^ position
]

{ #category : #accessing }
BLWidget >> position: anObject [

	<generated>
	position := anObject

]

{ #category : #accessing }
BLWidget >> size [

	<MSEProperty: #size type: #BLSize>
	<generated>
	<MSEComment: 'The size of the widget'>
	^ size
]

{ #category : #accessing }
BLWidget >> size: anObject [

	<generated>
	size := anObject

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
