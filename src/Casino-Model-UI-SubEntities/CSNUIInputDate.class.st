Class {
	#name : #CSNUIInputDate,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputDate class >> annotation [
	<MSEClass: #CSNUIInputDate super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputDate >> accept: anExporter [
	^ anExporter visitBLUIInputDate: self
]
