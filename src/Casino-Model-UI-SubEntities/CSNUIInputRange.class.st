Class {
	#name : #CSNUIInputRange,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputRange class >> annotation [
	<MSEClass: #CSNUIInputRange super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputRange >> accept: anExporter [
	^ anExporter visitUIInputRange: self
]
