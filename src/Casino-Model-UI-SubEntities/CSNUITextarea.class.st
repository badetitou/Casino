Class {
	#name : #CSNUITextarea,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUITextarea class >> annotation [
	<MSEClass: #CSNUITextarea super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUITextarea >> accept: anExporter [
	^ anExporter visitUITextarea: self
]
