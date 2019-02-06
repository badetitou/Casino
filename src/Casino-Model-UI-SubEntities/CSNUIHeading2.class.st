Class {
	#name : #CSNUIHeading2,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading2 class >> annotation [
	<MSEClass: #CSNUIHeading2 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading2 >> accept: anExporter [
	^ anExporter visitBLUIHeading2: self
]
