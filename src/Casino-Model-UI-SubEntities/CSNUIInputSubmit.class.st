Class {
	#name : #CSNUIInputSubmit,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputSubmit class >> annotation [

	<MSEClass: #InputSubmit super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputSubmit >> accept: anExporter [
	^ anExporter visitUIInputSubmit: self
]
