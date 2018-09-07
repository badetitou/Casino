Class {
	#name : #BLUIInputCheckbox,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputCheckbox class >> annotation [
	<MSEClass: #BLUIInputCheckbox super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputCheckbox >> accept: anExporter [
	^ anExporter visitBLUIInputCheckbox: self
]
