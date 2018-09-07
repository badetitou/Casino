Class {
	#name : #BLUIHeading3,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading3 class >> annotation [
	<MSEClass: #BLUIHeading3 super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading3 >> accept: anExporter [
	^ anExporter visitBLUIHeading3: self
]
