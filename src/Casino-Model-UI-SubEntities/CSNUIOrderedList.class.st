Class {
	#name : #CSNUIOrderedList,
	#superclass : #CSNUIList,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIOrderedList class >> annotation [
	<MSEClass: #CSNUIOrderedList super: #CSNUIList>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIOrderedList >> accept: anExporter [
	^ anExporter visitUIOrderedList: self
]
