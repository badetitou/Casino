Class {
	#name : #CSNUIInputDate,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputDate class >> annotation [

	<MSEClass: #InputDate super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputDate >> accept: anExporter [
	^ anExporter visitUIInputDate: self
]
