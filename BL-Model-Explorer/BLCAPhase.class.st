"
I represent a phase
"
Class {
	#name : #BLCAPhase,
	#superclass : #Object,
	#instVars : [
		'codePhase',
		'codeValue',
		'realClassName'
	],
	#category : 'BL-Model-Explorer'
}

{ #category : #meta }
BLCAPhase class >> annotation [
	<MSEClass: #BLCAPhase super: #FAMIXNamedEntity>
	<package: #BLWebModel>
	^ self
	
]

{ #category : #accessing }
BLCAPhase >> codePhase [
	^ codePhase
]

{ #category : #accessing }
BLCAPhase >> codePhase: anObject [
	codePhase := anObject
]

{ #category : #accessing }
BLCAPhase >> codeValue [
	^ codeValue
]

{ #category : #accessing }
BLCAPhase >> codeValue: anObject [
	codeValue := anObject
]

{ #category : #accessing }
BLCAPhase >> initialize [
	super initialize 
]

{ #category : #accessing }
BLCAPhase >> realClassName [
	^ realClassName
]

{ #category : #accessing }
BLCAPhase >> realClassName: anObject [
	realClassName := anObject
]
