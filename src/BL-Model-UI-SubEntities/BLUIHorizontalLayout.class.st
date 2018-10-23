Class {
	#name : #BLUIHorizontalLayout,
	#superclass : #BLLayout,
	#category : #'BL-Model-UI-SubEntities-Layout'
}

{ #category : #visiting }
BLUIHorizontalLayout >> accept: anExporter [
	^ anExporter visitBLUIHorizontalLayout: self
]
