Class {
	#name : #BLWidget,
	#superclass : #FAMIXNamedEntity,
	#instVars : [
		'realClass',
		'constructor',
		'containerMetier',
		'containerPhase',
		'notFound',
		'actionsAppel',
		'actionsAsynchrone'
	],
	#category : 'BLWebModel'
}

{ #category : #meta }
BLWidget class >> annotation [
	<MSEClass: #BLWidget super: #FAMIXEntity>
	<package: #BLWebModel>
	^ self
]

{ #category : #accessing }
BLWidget >> actionsAppel [
	<MSEProperty: #actionsAppel type: #BLActionAppel opposite: #appelant>
	<multivalued>
	<derived>
	<MSEComment: 'List of Action Appel'>
	^ actionsAppel
]

{ #category : #accessing }
BLWidget >> actionsAppel: actions [
	actionsAppel := actions 
]

{ #category : #accessing }
BLWidget >> constructor [
	<MSEProperty: #constructor type: #Object>
	^ constructor
]

{ #category : #accessing }
BLWidget >> constructor: theFAMIXInvocationOfTheInstanciation [
	constructor := theFAMIXInvocationOfTheInstanciation
]

{ #category : #accessing }
BLWidget >> containerMetier [
	<MSEProperty: #containerMetier type: #BLPageMetier opposite: #widgets>
	^ containerMetier
]

{ #category : #accessing }
BLWidget >> containerMetier: aBLPageMetier [
	containerMetier := aBLPageMetier
]

{ #category : #accessing }
BLWidget >> containerPhase [
	<MSEProperty: #containerPhase type: #BLPhase opposite: #widgets>
	^ containerPhase
]

{ #category : #accessing }
BLWidget >> containerPhase: aBLPhase [
	containerPhase := aBLPhase
]

{ #category : #accessing }
BLWidget >> initialize [
	super initialize.
	actionsAppel := FMMultivalueLink
		on: self
		opposite: #appelant:
]

{ #category : #accessing }
BLWidget >> notFound [
	<MSEProperty: #notFound type: #Boolean>
	^ notFound
]

{ #category : #accessing }
BLWidget >> notFound: aBoolean [
	notFound := aBoolean 
]

{ #category : #accessing }
BLWidget >> realClass [
	<MSEProperty: #realClass type: #Object>
	^ realClass
]

{ #category : #accessing }
BLWidget >> realClass: aClass [
	realClass := aClass
]
