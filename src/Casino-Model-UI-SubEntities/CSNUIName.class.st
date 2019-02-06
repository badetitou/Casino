Class {
	#name : #CSNUIName,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIName >> accept: anExporter [
	^ anExporter visitUIName: self
]
