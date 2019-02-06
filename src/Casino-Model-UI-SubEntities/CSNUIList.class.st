Class {
	#name : #CSNUIList,
	#superclass : #CSNUILeaf,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIList class >> annotation [
	<MSEClass: #CSNUIList super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIList >> accept: anExporter [
	^ anExporter visitBLUIList: self
]
