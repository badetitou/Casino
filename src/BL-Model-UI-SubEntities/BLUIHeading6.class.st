Class {
	#name : #BLUIHeading6,
	#superclass : #BLUILeaf,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading6 class >> annotation [
	<MSEClass: #BLUIHeading6 super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading6 >> accept: anExporter [
	^ anExporter visitBLUIHeading6: self
]
