Class {
	#name : #CSNUIInputDatetimeLocal,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputDatetimeLocal class >> annotation [

	<MSEClass: #InputDatetimeLocal super: #CSNUIInput>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIInputDatetimeLocal >> accept: anExporter [
	^ anExporter visitUIInputDatetimeLocal: self
]
