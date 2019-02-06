"
I correspond to the text inside a Button or
beside a textInput
"
Class {
	#name : #CSNUILabel,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUILabel >> accept: anExporter [
	^ anExporter visitUILabel: self
]
