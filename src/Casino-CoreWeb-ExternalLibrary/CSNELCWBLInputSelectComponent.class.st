"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CSNELCWBLInputSelectComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> attributeOf: aWidget [
	^ (super attributeOf: aWidget) , ({CSNUIClass new attributeValue: 'blcore-input'})
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> getSelector [
	^ 'select'
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> isNative [
	^ true
]

{ #category : #'as yet unclassified' }
CSNELCWBLInputSelectComponent class >> modulePath [
	^ '@angular/core'
]
