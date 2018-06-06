Class {
	#name : #BLPhase,
	#superclass : #FAMIXNamedEntity,
	#instVars : [
		'codePhase',
		'codeValue',
		'realClassName',
		'metiers',
		'widgets',
		'actions'
	],
	#category : 'BLWebModel'
}

{ #category : #meta }
BLPhase class >> annotation [
	<MSEClass: #BLPhase super: #FAMIXNamedEntity>
	<package: #BLWebModel>
	^ self
	
]

{ #category : #accessing }
BLPhase >> actions [
	<MSEProperty: #actions type: #BLActionAppel opposite: #call>
	<multivalued>
	<derived>
	<MSEComment: 'phase caller'>
	^ actions
]

{ #category : #accessing }
BLPhase >> actions: action [
	actions value: action
]

{ #category : #accessing }
BLPhase >> codePhase [
	<MSEProperty: #codePhase type: #String>
	^ codePhase
]

{ #category : #accessing }
BLPhase >> codePhase: anObject [
	codePhase := anObject
]

{ #category : #accessing }
BLPhase >> codeValue [
	<MSEProperty: #codeValue type: #String>
	^ codeValue
]

{ #category : #accessing }
BLPhase >> codeValue: anObject [
	codeValue := anObject
]

{ #category : #accessing }
BLPhase >> initialize [
	super initialize.
	metiers := FMMultiMultivalueLink on: self opposite: #container.
	widgets := FMMultivalueLink on: self opposite: #containerPhase:.
	actions := FMMultivalueLink on: self opposite: #call:
]

{ #category : #accessing }
BLPhase >> metiers [
	<MSEProperty: #metiers type: #BLPageMetier opposite: #container> 
	<multivalued> 
	<derived>
	<MSEComment: 'List of page metier'>
	
	^metiers
	
]

{ #category : #accessing }
BLPhase >> metiers: metier [
	metiers value: metier
	
]

{ #category : #accessing }
BLPhase >> realClassName [
	<MSEProperty: #realClassName type: #String>
	^ realClassName
]

{ #category : #accessing }
BLPhase >> realClassName: anObject [
	realClassName := anObject
]

{ #category : #accessing }
BLPhase >> widgets [
	<MSEProperty: #widgets type: #BLWidget opposite: #containerPhase>
	<multivalued>
	^ widgets
]

{ #category : #accessing }
BLPhase >> widgets: listOfWidget [
	widgets := listOfWidget 
]
