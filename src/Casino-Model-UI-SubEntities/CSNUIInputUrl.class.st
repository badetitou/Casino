Class {
	#name : #CSNUIInputUrl,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputUrl class >> annotation [

	<MSEClass: #InputUrl super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputUrl >> accept: anExporter [
	^ anExporter visitUIInputUrl: self
]
