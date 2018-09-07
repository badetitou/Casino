Class {
	#name : #BLUIInputColor,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputColor class >> annotation [
	<MSEClass: #BLUIInputColor super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputColor >> accept: anExporter [
	^ anExporter visitBLUIInputColor: self
]
