Class {
	#name : #CSNUIButton,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIButton class >> annotation [
	<MSEClass: #CSNUIButton super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIButton >> accept: anExporter [
	^ anExporter
		visitBLUIButton: self
]
