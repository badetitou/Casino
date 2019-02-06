Class {
	#name : #CSNUIInputTel,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputTel class >> annotation [
	<MSEClass: #CSNUIInputTel super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputTel >> accept: anExporter [
	^ anExporter visitBLUIInputTel: self
]
