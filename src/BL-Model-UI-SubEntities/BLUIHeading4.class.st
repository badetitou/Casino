Class {
	#name : #BLUIHeading4,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading4 class >> annotation [
	<MSEClass: #BLUIHeading4 super: #BLUILeaf>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading4 >> accept: anExporter [
	^ anExporter visitBLUIHeading4: self
]
