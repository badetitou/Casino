Class {
	#name : #BLUIInputDatetimeLocal,
	#superclass : #BLUIInput,
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInputDatetimeLocal class >> annotation [
	<MSEClass: #BLUIInputDatetimeLocal super: #BLUIInput>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInputDatetimeLocal >> accept: anExporter [
	^ anExporter visitBLUIInputDatetimeLocal: self
]
