"
I'm the main block of the user interface. Everything in a user interface is a widget with attributes
"
Class {
	#name : #CSNWidget,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #CSNAction opposite: #caller',
		'#attributes => FMMany type: #CSNAttribute opposite: #widget',
		'#cellOwner => FMOne type: #CSNCell opposite: #widget',
		'#position',
		'#realClass',
		'#size',
		'#widgetContainer => FMOne type: #CSNUIContainer opposite: #widgets'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNWidget class >> annotation [

	<MSEClass: #Widget super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNWidget class >> generatedSlotNames [
	<generated>
	'CSNWidget class>>#generatedSlotNames'.
	^ #(actions attributes cellOwner position realClass size widgetContainer)
]

{ #category : #generator }
CSNWidget class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNWidget class >> requirements [

	<generated>
	^ { CSNCell. CSNUIContainer }
]

{ #category : #accessing }
CSNWidget >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
CSNWidget >> actions: anObject [

	<generated>
	actions value: anObject

]

{ #category : #navigation }
CSNWidget >> actionsGroup [

	<generated>
	<navigation: 'Actions'>
	^ MooseGroup
			withAll: (self actions asSet)
]

{ #category : #accessing }
CSNWidget >> attributes [

	<generated>
	^ attributes
]

{ #category : #accessing }
CSNWidget >> attributes: anObject [

	<generated>
	attributes value: anObject

]

{ #category : #navigation }
CSNWidget >> attributesGroup [

	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup
			withAll: (self attributes asSet)
]

{ #category : #accessing }
CSNWidget >> belongsTo [

	<generated>
	^ self widgetContainer

]

{ #category : #accessing }
CSNWidget >> belongsTo: anObject [

	<generated>
	self widgetContainer: anObject

]

{ #category : #accessing }
CSNWidget >> cellOwner [

	<generated>
	<container>

	^ cellOwner
]

{ #category : #accessing }
CSNWidget >> cellOwner: anObject [

	<generated>
	cellOwner := anObject

]

{ #category : #navigation }
CSNWidget >> cellOwnerGroup [

	<generated>
	<navigation: 'CellOwner'>
	^ MooseGroup
			with: (self cellOwner)
]

{ #category : #accessing }
CSNWidget >> position [

	<MSEProperty: #position type: #CSNPosition>
	<generated>
	<MSEComment: 'The alignement of the widget'>
	^ position
]

{ #category : #accessing }
CSNWidget >> position: anObject [

	<generated>
	position := anObject

]

{ #category : #accessing }
CSNWidget >> size [

	<MSEProperty: #size type: #CSNSize>
	<generated>
	<MSEComment: 'The size of the widget'>
	^ size
]

{ #category : #accessing }
CSNWidget >> size: anObject [

	<generated>
	size := anObject

]

{ #category : #accessing }
CSNWidget >> widgetContainer [

	<generated>
	<container>

	^ widgetContainer
]

{ #category : #accessing }
CSNWidget >> widgetContainer: anObject [

	<generated>
	widgetContainer := anObject

]

{ #category : #navigation }
CSNWidget >> widgetContainerGroup [

	<generated>
	<navigation: 'WidgetContainer'>
	^ MooseGroup
			with: (self widgetContainer)
]
