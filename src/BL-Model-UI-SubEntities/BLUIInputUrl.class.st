Class {
	#name : #BLUIInputUrl,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputUrl class >> annotation [
	<MSEClass: #BLUIInputUrl super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputUrl >> accept: anExporter [
	^ anExporter visitBLUIInputUrl: self
]
