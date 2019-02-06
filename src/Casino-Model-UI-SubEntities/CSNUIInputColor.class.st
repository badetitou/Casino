Class {
	#name : #CSNUIInputColor,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputColor class >> annotation [
	<MSEClass: #CSNUIInputColor super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputColor >> accept: anExporter [
	^ anExporter visitUIInputColor: self
]
