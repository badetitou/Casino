Class {
	#name : #CSNUILink,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUILink class >> annotation [
	<MSEClass: #CSNUILink super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUILink >> accept: anExporter [
	^ anExporter visitUILink: self
]
