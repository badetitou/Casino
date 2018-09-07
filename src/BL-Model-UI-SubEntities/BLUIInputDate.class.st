Class {
	#name : #BLUIInputDate,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputDate class >> annotation [
	<MSEClass: #BLUIInputDate super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputDate >> accept: anExporter [
	^ anExporter visitBLUIInputDate: self
]
