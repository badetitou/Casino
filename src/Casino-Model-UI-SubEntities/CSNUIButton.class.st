Class {
	#name : #CSNUIButton,
	#superclass : #CSNUIContainer,
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
		visitUIButton: self
]
