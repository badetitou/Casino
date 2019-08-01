Class {
	#name : #CSNUIHeading6,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading6 class >> annotation [

	<MSEClass: #Heading6 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading6 >> accept: anExporter [
	^ anExporter visitUIHeading6: self
]
