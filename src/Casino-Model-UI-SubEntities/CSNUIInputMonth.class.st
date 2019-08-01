Class {
	#name : #CSNUIInputMonth,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputMonth class >> annotation [

	<MSEClass: #InputMonth super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputMonth >> accept: anExporter [
	^ anExporter visitUIInputMonth: self
]
