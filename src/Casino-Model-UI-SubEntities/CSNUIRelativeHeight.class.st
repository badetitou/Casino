Class {
	#name : #CSNUIRelativeHeight,
	#superclass : #CSNUIHeight,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIRelativeHeight >> accept: anExporter [
	^ anExporter visitUIRelativeHeight: self
]
