Class {
	#name : #CSNUIInputNumber,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputNumber class >> annotation [

	<MSEClass: #InputNumber super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputNumber >> accept: anExporter [
	^ anExporter visitUIInputNumber: self
]
