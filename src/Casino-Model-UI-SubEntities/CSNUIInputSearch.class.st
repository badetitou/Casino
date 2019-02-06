Class {
	#name : #CSNUIInputSearch,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInputSearch class >> annotation [
	<MSEClass: #CSNUIInputSearch super: #CSNUIInput>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInputSearch >> accept: anExporter [
	^ anExporter visitBLUIInputSearch: self
]
