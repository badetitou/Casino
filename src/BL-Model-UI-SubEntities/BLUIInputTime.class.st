Class {
	#name : #BLUIInputTime,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputTime class >> annotation [
	<MSEClass: #BLUIInputTime super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputTime >> accept: anExporter [
	^ anExporter visitBLUIInputTime: self
]
