Class {
	#name : #BLUIInputPassword,
	#superclass : #BLUIInputText,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputPassword class >> annotation [
	<MSEClass: #BLUIInputPassword super: #BLUIInputText>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputPassword >> accept: anExporter [
	^ anExporter visitBLUIInputPassword: self
]
