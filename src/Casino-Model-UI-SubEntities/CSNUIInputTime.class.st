Class {
	#name : #CSNUIInputTime,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputTime class >> annotation [

	<MSEClass: #InputTime super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputTime >> accept: anExporter [
	^ anExporter visitUIInputTime: self
]
