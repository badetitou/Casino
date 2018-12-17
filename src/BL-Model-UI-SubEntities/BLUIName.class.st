Class {
	#name : #BLUIName,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIName >> accept: anExporter [
	^ anExporter visitBLUIName: self
]
