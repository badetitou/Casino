Class {
	#name : #BLUIAbsoluteHeight,
	#superclass : #BLUIHeight,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIAbsoluteHeight >> accept: anExporter [
	^ anExporter visitBLUIAbsoluteHeight: self
]
