Class {
	#name : #BLUIRelativeWidth,
	#superclass : #BLUIWidth,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIRelativeWidth >> accept: anExporter [
	^ anExporter visitBLUIRelativeWidth: self
]
