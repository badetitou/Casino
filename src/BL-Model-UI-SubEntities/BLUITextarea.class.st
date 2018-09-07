Class {
	#name : #BLUITextarea,
	#superclass : #BLUIContainer,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUITextarea class >> annotation [
	<MSEClass: #BLUITextarea super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUITextarea >> accept: anExporter [
	^ anExporter visitBLUITextarea: self
]
