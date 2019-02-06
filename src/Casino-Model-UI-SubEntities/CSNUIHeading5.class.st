Class {
	#name : #CSNUIHeading5,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading5 class >> annotation [
	<MSEClass: #CSNUIHeading5 super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIHeading5 >> accept: anExporter [
	^ anExporter visitUIHeading5: self
]
