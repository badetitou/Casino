Class {
	#name : #BLUIPlaceholder,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIPlaceholder >> accept: anExporter [
	^ anExporter visitBLUIPlaceholder: self
]
