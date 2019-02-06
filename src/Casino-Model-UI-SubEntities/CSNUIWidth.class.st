Class {
	#name : #CSNUIWidth,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIWidth >> accept: anExporter [
	^ anExporter visitBLUIWidth: self
]
