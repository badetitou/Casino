Class {
	#name : #BLUILink,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUILink class >> annotation [
	<MSEClass: #BLUILink super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUILink >> accept: anExporter [
	^ anExporter visitBLUILink: self
]
