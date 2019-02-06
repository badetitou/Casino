Class {
	#name : #CSNUITabManager,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
CSNUITabManager >> accept: anExporter [
	^ anExporter visitUITabManager: self
]
