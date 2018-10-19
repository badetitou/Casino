Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLAction opposite: #caller',
		'#attributes => FMMany type: #BLAttribute opposite: #widget',
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
	^ #(realClass size position widgetContainer actions attributes)
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
