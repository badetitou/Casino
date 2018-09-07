Class {
	#name : #BLUIInputEmail,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputEmail class >> annotation [
	<MSEClass: #BLUIInputEmail super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputEmail >> accept: anExporter [
	^ anExporter visitBLUIInputEmail: self
]
