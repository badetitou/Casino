Class {
	#name : #BLUIParagraph,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIParagraph class >> annotation [
	<MSEClass: #BLUIParagraph super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIParagraph >> accept: anExporter [
	^ anExporter visitBLUIParagraph: self
]
