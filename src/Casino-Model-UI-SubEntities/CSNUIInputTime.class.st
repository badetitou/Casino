Class {
	#name : #CSNUIInputTime,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputTime class >> annotation [
	<MSEClass: #CSNUIInputTime super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputTime >> accept: anExporter [
	^ anExporter visitBLUIInputTime: self
]
