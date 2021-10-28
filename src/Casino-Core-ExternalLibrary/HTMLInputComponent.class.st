Class {
	#name : #HTMLInputComponent,
	#superclass : #HTMLComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
HTMLInputComponent >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #accessing }
HTMLInputComponent >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #accessing }
HTMLInputComponent >> getSelector [
	^ 'input'
]
