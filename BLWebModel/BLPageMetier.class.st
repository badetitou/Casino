Class {
	#name : #BLPageMetier,
	#superclass : #FAMIXNamedEntity,
	#instVars : [
		'container',
		'widgets'
	],
	#category : 'BLWebModel'
}

{ #category : #meta }
BLPageMetier class >> annotation [
	<MSEClass: #BLPageMetier super: #FAMIXNamedEntity>
	<package: #BLWebModel>
	^ self
]

{ #category : #initialization }
BLPageMetier >> container [
	<MSEProperty: #container type: #BLPhase opposite: #metiers> 
	<multivalued> 
	<derived>
	<MSEComment: 'List of phase'>
	
	^ container
]

{ #category : #initialization }
BLPageMetier >> container: containers [
	
	container := containers
]

{ #category : #initialization }
BLPageMetier >> initialize [
	super initialize.
	container := FMMultiMultivalueLink on: self opposite: #metiers.
	widgets := FMMultivalueLink on: self opposite: #containerMetier:
]

{ #category : #initialization }
BLPageMetier >> widgets [
	<MSEProperty: #widgets type: #BLWidget opposite: #containerMetier>
	<multivalued>
	^ widgets
]

{ #category : #initialization }
BLPageMetier >> widgets: listOfWidget [
	widgets := listOfWidget
]
