Class {
	#name : #CSNUIInputRange,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputRange class >> annotation [

	<MSEClass: #InputRange super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputRange >> accept: anExporter [
	^ anExporter visitUIInputRange: self
]
