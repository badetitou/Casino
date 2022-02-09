Class {
	#name : #CSNNotFound,
	#superclass : #Object,
	#classVars : [
		'Default'
	],
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #accessing }
CSNNotFound class >> default [
	^ Default ifNil: [ Default := self new ]
]

{ #category : #testing }
CSNNotFound >> isNotFound [
	^ true
]
