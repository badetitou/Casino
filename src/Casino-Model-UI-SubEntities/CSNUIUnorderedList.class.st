Class {
	#name : #CSNUIUnorderedList,
	#superclass : #CSNUIList,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIUnorderedList class >> annotation [
	<MSEClass: #CSNUIUnorderedList super: #CSNUIList>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIUnorderedList >> accept: anExporter [
	^ anExporter visitUIUnorderedList: self
]
