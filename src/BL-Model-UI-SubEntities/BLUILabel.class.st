"
I correspond to the text inside a Button or
beside a textInput
"
Class {
	#name : #BLUILabel,
	#superclass : #BLAttribute,
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUILabel >> accept: anExporter [
	^ anExporter visitBLUILabel: self
]
