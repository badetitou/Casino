Class {
	#name : #BLUIInputSearch,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputSearch class >> annotation [
	<MSEClass: #BLUIInputSearch super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputSearch >> accept: anExporter [
	^ anExporter visitBLUIInputSearch: self
]
