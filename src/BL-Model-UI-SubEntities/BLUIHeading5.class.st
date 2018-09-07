Class {
	#name : #BLUIHeading5,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIHeading5 class >> annotation [
	<MSEClass: #BLUIHeading5 super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIHeading5 >> accept: anExporter [
	^ anExporter visitBLUIHeading5: self
]
