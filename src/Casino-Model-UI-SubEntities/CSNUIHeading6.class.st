Class {
	#name : #CSNUIHeading6,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading6 class >> annotation [
	<MSEClass: #CSNUIHeading6 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading6 >> accept: anExporter [
	^ anExporter visitBLUIHeading6: self
]
