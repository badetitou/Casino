Class {
	#name : #CSNUIRelativeWidth,
	#superclass : #CSNUIWidth,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIRelativeWidth >> accept: anExporter [
	^ anExporter visitUIRelativeWidth: self
]
