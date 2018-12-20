Class {
	#name : #BLUIList,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIList class >> annotation [
	<MSEClass: #BLUIList super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIList >> accept: anExporter [
	^ anExporter visitBLUIList: self
]
