Class {
	#name : #CSNELCWBLInputComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> attributeOf: aWidget [
	^ (super attributeOf: aWidget) , ({CSNUIClass new attributeValue: 'blcore-input'})
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> getSelector [
	^ 'input'
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> isNative [
	^ true
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputComponent class >> modulePath [
	^ '@angular/core'
]
