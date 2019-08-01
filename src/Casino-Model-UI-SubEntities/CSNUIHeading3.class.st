Class {
	#name : #CSNUIHeading3,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading3 class >> annotation [

	<MSEClass: #Heading3 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading3 >> accept: anExporter [
	^ anExporter visitUIHeading3: self
]
