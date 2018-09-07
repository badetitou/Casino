Class {
	#name : #BLUIInputTel,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputTel class >> annotation [
	<MSEClass: #BLUIInputTel super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputTel >> accept: anExporter [
	^ anExporter visitBLUIInputTel: self
]
