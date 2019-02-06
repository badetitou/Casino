Class {
	#name : #CSNUIInputRadio,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputRadio class >> annotation [
	<MSEClass: #CSNUIInputRadio super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputRadio >> accept: anExporter [
	^ anExporter visitUIInputRadio: self
]
