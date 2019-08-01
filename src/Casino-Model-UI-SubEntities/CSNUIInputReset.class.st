Class {
	#name : #CSNUIInputReset,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputReset class >> annotation [

	<MSEClass: #InputReset super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputReset >> accept: anExporter [
	^ anExporter visitUIInputReset: self
]
