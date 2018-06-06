"
I represent a widget entity
I can be everything in a User Interface (Button/Pannel/Text/Presenter)
"
Class {
	#name : #BLWidget,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTWidget + BLTWithActionAppels + BLTWithAttributes',
	#classTraits : 'BLTWidget classTrait + BLTWithActionAppels classTrait + BLTWithAttributes classTrait',
	#instVars : [
		'#constructor',
		'#parameters',
		'#realClass',
		'#variable'
	],
	#category : 'BL-Model-Entities'
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
	^ #(realClass)
]

{ #category : #generator }
BLWidget class >> generatedTraitNames [
	<generated>
	^ #(BLTWidget BLTWithActionAppels BLTWithAttributes)
]

{ #category : #meta }
BLWidget class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLWidget >> actionAppelsGroup [

	<generated>
	<navigation: 'ActionAppels'>
	^ MooseGroup
			withAll: (self actionAppels asSet)
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
BLWidget >> widgetGroup [

	<generated>
	<navigation: 'Widget'>
	^ MooseGroup
			with: (self widget)
]
