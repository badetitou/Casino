Class {
	#name : #CSNUIHeading4,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading4 class >> annotation [

	<MSEClass: #Heading4 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading4 >> accept: anExporter [
	^ anExporter visitUIHeading4: self
]
