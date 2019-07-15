Class {
	#name : #CSNUICanvas,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
CSNUICanvas >> accept: anExporter [
	^ anExporter visitUICanvas: self
]
