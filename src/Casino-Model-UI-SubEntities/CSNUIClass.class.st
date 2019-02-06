Class {
	#name : #CSNUIClass,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIClass >> accept: anExporter [
	^ anExporter visitUIClass: self
]
