Class {
	#name : #BLUIInputReset,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputReset class >> annotation [
	<MSEClass: #BLUIInputReset super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputReset >> accept: anExporter [
	^ anExporter visitBLUIInputReset: self
]
