Class {
	#name : #CSNUIImage,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIImage class >> annotation [
	<MSEClass: #CSNUIImage super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIImage >> accept: anExporter [
	^ anExporter visitUIImage: self
]
