Class {
	#name : #BLUIInputSubmit,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputSubmit class >> annotation [
	<MSEClass: #BLUIInputSubmit super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputSubmit >> accept: anExporter [
	^ anExporter visitBLUIInputSubmit: self
]
