Class {
	#name : #CSNUITree,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
CSNUITree >> accept: anExporter [
	^ anExporter visitBLUITree: self
]
