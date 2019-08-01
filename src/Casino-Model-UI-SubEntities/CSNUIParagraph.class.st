Class {
	#name : #CSNUIParagraph,
	#superclass : #CSNLeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIParagraph class >> annotation [

	<MSEClass: #Paragraph super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIParagraph >> accept: anExporter [
	^ anExporter visitUIParagraph: self
]
