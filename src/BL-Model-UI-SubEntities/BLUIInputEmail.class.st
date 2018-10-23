Class {
	#name : #BLUIInputEmail,
	#superclass : #BLUIInputText,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputEmail class >> annotation [
	<MSEClass: #BLUIInputEmail super: #BLUIInputText>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputEmail >> accept: anExporter [
	^ anExporter visitBLUIInputEmail: self
]
