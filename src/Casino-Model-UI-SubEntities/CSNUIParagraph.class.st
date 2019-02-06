Class {
	#name : #CSNUIParagraph,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIParagraph class >> annotation [
	<MSEClass: #CSNUIParagraph super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIParagraph >> accept: anExporter [
	^ anExporter visitBLUIParagraph: self
]
