Class {
	#name : #BLUIClass,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIClass >> accept: anExporter [
	^ anExporter visitBLUIClass: self
]
