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

{ #category : #'accessing - export' }
CSNELCWBLInputSelectComponent class >> attributeDictionary [
	^ super attributeDictionary
		at: CSNUIWidth put: 'style';
		yourself
]

{ #category : #export }
CSNELCWBLInputSelectComponent class >> attributeOf: aWidget [
	^ (super attributeOf: aWidget) , ({CSNUIClass new attributeValue: 'blcore-input'})
]

{ #category : #export }
CSNELCWBLInputSelectComponent class >> export: aWidget with: anExporter [
	self exportHeaderOf: aWidget with: anExporter
]

{ #category : #export }
CSNELCWBLInputSelectComponent class >> exportAttribute: attribute with: anExporter [
	attribute class = CSNUIWidth
		ifTrue: [ anExporter
				<<< attribute name;
				<<< ':';
				<<< (anExporter protectString: attribute attributeValue asString);
				<<< ';' ]
		ifFalse: [ super exportAttribute: attribute with: anExporter ]
]

{ #category : #export }
CSNELCWBLInputSelectComponent class >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter <<< '/>'
]

{ #category : #accessing }
CSNELCWBLInputSelectComponent class >> getSelector [
	^ 'select'
]

{ #category : #accessing }
CSNELCWBLInputSelectComponent class >> isNative [
	^ true
]

{ #category : #accessing }
CSNELCWBLInputSelectComponent class >> modulePath [
	^ '@angular/core'
]
