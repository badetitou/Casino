Class {
	#name : #CSNUIInputPassword,
	#superclass : #CSNUIInputText,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputPassword class >> annotation [
	<MSEClass: #CSNUIInputPassword super: #CSNUIInputText>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputPassword >> accept: anExporter [
	^ anExporter visitUIInputPassword: self
]
