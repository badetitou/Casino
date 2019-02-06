Class {
	#name : #CSNUIAbsoluteHeight,
	#superclass : #CSNUIHeight,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIAbsoluteHeight >> accept: anExporter [
	^ anExporter visitUIAbsoluteHeight: self
]
