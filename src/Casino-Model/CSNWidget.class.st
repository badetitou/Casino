"
I'm the main block of the user interface. Everything in a user interface is a widget with attributes
"
Class {
	#name : #CSNWidget,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #CSNAction opposite: #caller',
		'#attributes => FMMany type: #CSNAttribute opposite: #widget',
		'#realClass => FMProperty',
		'#widgetContainer => FMOne type: #CSNContainer opposite: #widgets'
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

{ #category : #meta }
CSNWidget class >> requirements [

	<generated>
	^ { CSNContainer }
]

{ #category : #accessing }
CSNWidget >> actions [
	"Relation named: #actions type: #CSNAction opposite: #caller"

	<generated>
	<derived>
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
	^ MooseGroup withAll: self actions asSet
]

{ #category : #adding }
CSNWidget >> addActions: anObject [
	<generated>
	^ self actions add: anObject
]

{ #category : #adding }
CSNWidget >> addAttributes: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
CSNWidget >> attributes [
	"Relation named: #attributes type: #CSNAttribute opposite: #widget"

	<generated>
	<derived>
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
	^ MooseGroup withAll: self attributes asSet
]

{ #category : #accessing }
CSNWidget >> widgetContainer [
	"Relation named: #widgetContainer type: #CSNContainer opposite: #widgets"

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
	^ MooseGroup with: self widgetContainer
]
