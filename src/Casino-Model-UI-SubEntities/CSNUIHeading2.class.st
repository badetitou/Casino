Class {
	#name : #CSNUIHeading2,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading2 class >> annotation [

	<MSEClass: #Heading2 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading2 >> accept: anExporter [
	^ anExporter visitUIHeading2: self
]
