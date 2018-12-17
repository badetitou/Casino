Class {
	#name : #BLUIValue,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIValue >> accept: anExporter [
	^ anExporter visitBLUIValue: self
]
