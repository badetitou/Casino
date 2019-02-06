Class {
	#name : #CSNUIInputSubmit,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputSubmit class >> annotation [
	<MSEClass: #CSNUIInputSubmit super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputSubmit >> accept: anExporter [
	^ anExporter visitBLUIInputSubmit: self
]
