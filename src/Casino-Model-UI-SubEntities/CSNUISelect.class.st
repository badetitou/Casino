Class {
	#name : #CSNUISelect,
	#superclass : #CSNUIInput,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUISelect class >> annotation [
	<MSEClass: #CSNUISelect super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #visiting }
CSNUISelect >> accept: anExporter [
	^ anExporter visitUISelect: self
]
