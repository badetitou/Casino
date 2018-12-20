Class {
	#name : #BLUIHeading2,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading2 class >> annotation [
	<MSEClass: #BLUIHeading2 super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading2 >> accept: anExporter [
	^ anExporter visitBLUIHeading2: self
]
