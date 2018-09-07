Class {
	#name : #BLUIParagraph,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIParagraph class >> annotation [
	<MSEClass: #BLUIParagraph super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIParagraph >> accept: anExporter [
	^ anExporter visitBLUIParagraph: self
]
