Class {
	#name : #HTMLInputComponent,
	#superclass : #HTMLComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
HTMLInputComponent class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #accessing }
HTMLInputComponent class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #accessing }
HTMLInputComponent class >> getSelector [
	^ 'input'
]
