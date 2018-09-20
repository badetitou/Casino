Class {
	#name : #BLUITree,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
BLUITree >> accept: anExporter [
	^ anExporter visitBLUITree: self
]
