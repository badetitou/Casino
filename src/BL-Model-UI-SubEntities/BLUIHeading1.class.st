Class {
	#name : #BLUIHeading1,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading1 class >> annotation [
	<MSEClass: #BLUIHeading1 super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading1 >> accept: anExporter [
	^ anExporter visitBLUIHeading1: self
]
