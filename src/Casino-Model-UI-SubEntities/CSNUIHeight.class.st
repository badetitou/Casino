"
Images in HTML have a set of size attributes, which specifies the width and height of an image (or div element)
"
Class {
	#name : #CSNUIHeight,
	#superclass : #CSNAttribute,
	#instVars : [
		'text'
	],
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIHeight >> accept: anExporter [
	^ anExporter visitUIHeight: self
]
