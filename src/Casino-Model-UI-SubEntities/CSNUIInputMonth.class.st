Class {
	#name : #CSNUIInputMonth,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputMonth class >> annotation [
	<MSEClass: #CSNUIInputMonth super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputMonth >> accept: anExporter [
	^ anExporter visitUIInputMonth: self
]
