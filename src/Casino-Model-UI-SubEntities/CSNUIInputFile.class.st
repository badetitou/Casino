Class {
	#name : #CSNUIInputFile,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputFile class >> annotation [
	<MSEClass: #CSNUIInputFile super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputFile >> accept: anExporter [
	^ anExporter visitBLUIInputFile: self
]
