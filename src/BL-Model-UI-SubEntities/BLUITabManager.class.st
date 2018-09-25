Class {
	#name : #BLUITabManager,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
BLUITabManager >> accept: anExporter [
	^ anExporter visitBLUITabManager: self
]
