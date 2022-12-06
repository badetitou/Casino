Class {
	#name : #CSNVPage,
	#superclass : #Object,
	#instVars : [
		'module',
		'model'
	],
	#category : #'Casino-Model-Visualisation-PackagesGroupModule'
}

{ #category : #accessing }
CSNVPage >> allChildren [
	^ self children
]

{ #category : #accessing }
CSNVPage >> children [
	^ {  }
]

{ #category : #accessing }
CSNVPage >> model [

	^ model
]

{ #category : #accessing }
CSNVPage >> model: anObject [

	model := anObject
]

{ #category : #accessing }
CSNVPage >> module [

	^ module
]

{ #category : #accessing }
CSNVPage >> module: anObject [

	module := anObject
]
