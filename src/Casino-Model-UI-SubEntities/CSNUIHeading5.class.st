Class {
	#name : #CSNUIHeading5,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIHeading5 class >> annotation [

	<MSEClass: #Heading5 super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIHeading5 >> accept: anExporter [
	^ anExporter visitUIHeading5: self
]
