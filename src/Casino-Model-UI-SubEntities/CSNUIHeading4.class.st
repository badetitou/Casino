Class {
	#name : #CSNUIHeading4,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading4 class >> annotation [
	<MSEClass: #CSNUIHeading4 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading4 >> accept: anExporter [
	^ anExporter visitUIHeading4: self
]
