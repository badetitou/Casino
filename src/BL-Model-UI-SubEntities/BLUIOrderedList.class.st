Class {
	#name : #BLUIOrderedList,
	#superclass : #BLUIList,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIOrderedList class >> annotation [
	<MSEClass: #BLUIOrderedList super: #BLUIList>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIOrderedList >> accept: anExporter [
	^ anExporter visitBLUIOrderedList: self
]
