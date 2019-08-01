Class {
	#name : #CSNUIInputTel,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputTel class >> annotation [

	<MSEClass: #InputTel super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputTel >> accept: anExporter [
	^ anExporter visitUIInputTel: self
]
