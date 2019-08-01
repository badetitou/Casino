Class {
	#name : #CSNUIInputSearch,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputSearch class >> annotation [

	<MSEClass: #InputSearch super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputSearch >> accept: anExporter [
	^ anExporter visitUIInputSearch: self
]
