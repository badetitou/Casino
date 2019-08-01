Class {
	#name : #CSNUIInputRadio,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputRadio class >> annotation [

	<MSEClass: #InputRadio super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputRadio >> accept: anExporter [
	^ anExporter visitUIInputRadio: self
]
