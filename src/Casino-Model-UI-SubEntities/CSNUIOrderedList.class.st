Class {
	#name : #CSNUIOrderedList,
	#superclass : #CSNUIList,
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIOrderedList class >> annotation [

	<MSEClass: #OrderedList super: #CSNUIList>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUIOrderedList >> accept: anExporter [
	^ anExporter visitUIOrderedList: self
]
