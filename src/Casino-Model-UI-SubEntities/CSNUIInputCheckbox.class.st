Class {
	#name : #CSNUIInputCheckbox,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputCheckbox class >> annotation [
	<MSEClass: #CSNUIInputCheckbox super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputCheckbox >> accept: anExporter [
	^ anExporter visitBLUIInputCheckbox: self
]
