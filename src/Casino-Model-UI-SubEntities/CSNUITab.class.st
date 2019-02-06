"
Can be only contained by a BLUITabManager

contain the title of the tag 
an optionnal icon
the model -> contained widget 
"
Class {
	#name : #CSNUITab,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets-Extended'
}

{ #category : #visiting }
CSNUITab >> accept: anExporter [
	^ anExporter visitBLUITab: self
]
