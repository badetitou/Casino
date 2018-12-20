Class {
	#name : #BLUILink,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUILink class >> annotation [
	<MSEClass: #BLUILink super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUILink >> accept: anExporter [
	^ anExporter visitBLUILink: self
]
