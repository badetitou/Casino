Class {
	#name : #CSNELCWBLInputComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #export }
CSNELCWBLInputComponent class >> attributeOf: aWidget [
	^ (super attributeOf: aWidget) , ({CSNUIClass new attributeValue: 'blcore-input'})
]

{ #category : #export }
CSNELCWBLInputComponent class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #export }
CSNELCWBLInputComponent class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #accessing }
CSNELCWBLInputComponent class >> getSelector [
	^ 'input'
]

{ #category : #accessing }
CSNELCWBLInputComponent class >> isNative [
	^ true
]

{ #category : #accessing }
CSNELCWBLInputComponent class >> modulePath [
	^ '@angular/core'
]
