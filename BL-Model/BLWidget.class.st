"
I represent a widget entity
I can be everything in a User Interface (Button/Pannel/Text/Presenter)
"
Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTWidget + BLTWithActions + BLTWithAttributes',
	#classTraits : 'BLTWidget classTrait + BLTWithActions classTrait + BLTWithAttributes classTrait',
	#instVars : [
		'#constructor',
		'#parameters',
		'#realClass',
		'#variable'
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
	^ #(realClass)
]

{ #category : #generator }
BLWidget class >> generatedTraitNames [
	<generated>
	^ #(BLTWidget BLTWithActions BLTWithAttributes)
]

{ #category : #meta }
BLWidget class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLWidget >> actionsGroup [

	<generated>
	<navigation: 'Actions'>
	^ MooseGroup
			withAll: (self actions asSet)
]

{ #category : #navigation }
BLWidget >> attributesGroup [

	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup
			withAll: (self attributes asSet)
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

{ #category : #navigation }
BLWidget >> widgetOwnerGroup [

	<generated>
	<navigation: 'WidgetOwner'>
	^ MooseGroup
			with: (self widgetOwner)
]
