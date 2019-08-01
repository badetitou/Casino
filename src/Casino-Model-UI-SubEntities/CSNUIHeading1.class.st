Class {
	#name : #CSNUIHeading1,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading1 class >> annotation [

	<MSEClass: #Heading1 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading1 >> accept: anExporter [
	^ anExporter visitUIHeading1: self
]
