Class {
	#name : #CSNUIPlaceholder,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIPlaceholder >> accept: anExporter [
	^ anExporter visitUIPlaceholder: self
]
