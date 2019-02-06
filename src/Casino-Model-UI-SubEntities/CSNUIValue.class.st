Class {
	#name : #CSNUIValue,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIValue >> accept: anExporter [
	^ anExporter visitBLUIValue: self
]
