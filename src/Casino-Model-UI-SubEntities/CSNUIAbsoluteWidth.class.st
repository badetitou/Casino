Class {
	#name : #CSNUIAbsoluteWidth,
	#superclass : #CSNUIWidth,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIAbsoluteWidth >> accept: anExporter [
	^ anExporter visitUIAbsoluteWidth: self
]
