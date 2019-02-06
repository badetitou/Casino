Class {
	#name : #CSNUITable,
	#superclass : #CSNUIContainer,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUITable class >> annotation [
	<MSEClass: #CSNUITable super: #CSNUIContainer>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUITable >> accept: anExporter [
	^ anExporter visitUITable: self
]
