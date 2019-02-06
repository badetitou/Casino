Class {
	#name : #CSNUIVerticalLayout,
	#superclass : #CSNLayout,
	#category : #'Casino-Model-UI-SubEntities-Layout'
}

{ #category : #visiting }
CSNUIVerticalLayout >> accept: anExporter [
	^ anExporter visitUIVerticalLayout: self
]
