Class {
	#name : #BLUIWidth,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIWidth >> accept: anExporter [
	^ anExporter visitBLUIWidth: self
]
