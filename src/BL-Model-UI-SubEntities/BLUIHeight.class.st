"
Images in HTML have a set of size attributes, which specifies the width and height of an image (or div element)
"
Class {
	#name : #BLUIHeight,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIHeight >> accept: anExporter [
	^ anExporter visitBLUIHeight: self
]
