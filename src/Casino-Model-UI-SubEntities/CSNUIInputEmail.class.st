Class {
	#name : #CSNUIInputEmail,
	#superclass : #CSNUIInputText,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputEmail class >> annotation [
	<MSEClass: #CSNUIInputEmail super: #CSNUIInputText>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputEmail >> accept: anExporter [
	^ anExporter visitBLUIInputEmail: self
]
