Class {
	#name : #BLUIInputRadio,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputRadio class >> annotation [
	<MSEClass: #BLUIInputRadio super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputRadio >> accept: anExporter [
	^ anExporter visitBLUIInputRadio: self
]
