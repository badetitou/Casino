Class {
	#name : #CSNUIInputCheckbox,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputCheckbox class >> annotation [

	<MSEClass: #InputCheckbox super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputCheckbox >> accept: anExporter [
	^ anExporter visitUIInputCheckbox: self
]
