Class {
	#name : #BLUIAbsoluteWidth,
	#superclass : #BLUIWidth,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIAbsoluteWidth >> accept: anExporter [
	^ anExporter visitBLUIAbsoluteWidth: self
]
