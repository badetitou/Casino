Class {
	#name : #CSNUIInputText,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputText class >> annotation [
	<MSEClass: #CSNUIInputText super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputText >> accept: anExporter [
	^ anExporter visitBLUIInputText: self
]
