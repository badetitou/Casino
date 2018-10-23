Class {
	#name : #BLUIVerticalLayout,
	#superclass : #BLLayout,
	#category : #'BL-Model-UI-SubEntities-Layout'
}

{ #category : #visiting }
BLUIVerticalLayout >> accept: anExporter [
	^ anExporter visitBLUIVerticalLayout: self
]
