Class {
	#name : #CSNUIInputDatetimeLocal,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputDatetimeLocal class >> annotation [
	<MSEClass: #CSNUIInputDatetimeLocal super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputDatetimeLocal >> accept: anExporter [
	^ anExporter visitUIInputDatetimeLocal: self
]
