Class {
	#name : #CSNUICanvas,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #visiting }
CSNUICanvas >> accept: anExporter [
	^ anExporter visitUICanvas: self
]
