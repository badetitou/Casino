Class {
	#name : #BLUIInputMonth,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputMonth class >> annotation [
	<MSEClass: #BLUIInputMonth super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputMonth >> accept: anExporter [
	^ anExporter visitBLUIInputMonth: self
]
