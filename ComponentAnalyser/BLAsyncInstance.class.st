Class {
	#name : #BLAsyncInstance,
	#superclass : #Object,
	#instVars : [
		'link',
		'constructor'
	],
	#category : 'ComponentAnalyser'
}

{ #category : #accessing }
BLAsyncInstance >> constructor [
	^ constructor
]

{ #category : #accessing }
BLAsyncInstance >> constructor: anObject [
	constructor := anObject
]

{ #category : #accessing }
BLAsyncInstance >> link [
	^ link
]

{ #category : #accessing }
BLAsyncInstance >> link: anObject [
	link := anObject
]
