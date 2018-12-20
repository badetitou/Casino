Class {
	#name : #BLUIButton,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIButton class >> annotation [
	<MSEClass: #BLUIButton super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIButton >> accept: anExporter [
	^ anExporter
		visitBLUIButton: self
]
