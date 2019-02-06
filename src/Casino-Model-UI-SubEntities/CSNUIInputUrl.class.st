Class {
	#name : #CSNUIInputUrl,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputUrl class >> annotation [
	<MSEClass: #CSNUIInputUrl super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputUrl >> accept: anExporter [
	^ anExporter visitUIInputUrl: self
]
