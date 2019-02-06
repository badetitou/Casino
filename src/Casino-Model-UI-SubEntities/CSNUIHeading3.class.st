Class {
	#name : #CSNUIHeading3,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading3 class >> annotation [
	<MSEClass: #CSNUIHeading3 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading3 >> accept: anExporter [
	^ anExporter visitUIHeading3: self
]
