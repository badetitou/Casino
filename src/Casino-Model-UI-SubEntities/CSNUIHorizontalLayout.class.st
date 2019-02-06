Class {
	#name : #CSNUIHorizontalLayout,
	#superclass : #CSNLayout,
	#category : #'Casino-Model-UI-SubEntities-Layout'
}

{ #category : #visiting }
CSNUIHorizontalLayout >> accept: anExporter [
	^ anExporter visitUIHorizontalLayout: self
]
