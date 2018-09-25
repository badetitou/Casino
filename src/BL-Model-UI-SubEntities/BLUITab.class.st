"
Can be only contained by a BLUITabManager

contain the title of the tag 
an optionnal icon
the model -> contained widget 
"
Class {
	#name : #BLUITab,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
BLUITab >> accept: anExporter [
	^ anExporter visitBLUITab: self
]
