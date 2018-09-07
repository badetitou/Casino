Class {
	#name : #BLUIInputText,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputText class >> annotation [
	<MSEClass: #BLUIInputText super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputText >> accept: anExporter [
	^ anExporter visitBLUIInputText: self
]
