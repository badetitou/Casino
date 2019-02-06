Class {
	#name : #CSNUIInputWeek,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputWeek class >> annotation [
	<MSEClass: #CSNUIInputWeek super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputWeek >> accept: anExporter [
	^ anExporter visitUIInputWeek: self
]
