Class {
	#name : #BLUIRelativeHeight,
	#superclass : #BLUIHeight,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIRelativeHeight >> accept: anExporter [
	^ anExporter visitBLUIRelativeHeight: self
]
