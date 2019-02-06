Class {
	#name : #CSNUIHeading1,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading1 class >> annotation [
	<MSEClass: #CSNUIHeading1 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading1 >> accept: anExporter [
	^ anExporter visitUIHeading1: self
]
