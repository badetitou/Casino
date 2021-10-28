Class {
	#name : #CSNELCWBLInputComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #export }
CSNELCWBLInputComponent >> attributeOf: aWidget [
	^ (super attributeOf: aWidget) , ({CSNUIClass new attributeValue: 'blcore-input'})
]

{ #category : #export }
CSNELCWBLInputComponent >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #export }
CSNELCWBLInputComponent >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #accessing }
CSNELCWBLInputComponent >> getSelector [
	^ 'input'
]

{ #category : #accessing }
CSNELCWBLInputComponent >> isNative [
	^ true
]

{ #category : #accessing }
CSNELCWBLInputComponent >> modulePath [
	^ '@angular/core'
]
