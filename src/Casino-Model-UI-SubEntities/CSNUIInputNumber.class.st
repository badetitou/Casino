Class {
	#name : #CSNUIInputNumber,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputNumber class >> annotation [
	<MSEClass: #CSNUIInputNumber super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputNumber >> accept: anExporter [
	^ anExporter visitUIInputNumber: self
]
