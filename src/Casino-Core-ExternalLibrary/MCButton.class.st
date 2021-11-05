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
	#name : #MCButton,
	#superclass : #MaterialComponent,
	#instVars : [
		'isLink'
	],
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCButton >> attributeOf: aWidget [

	^ aWidget computeSelfAttributes reject: [ :attribute | "Label are used in the content" 
		  attribute isKindOf: CSNUILabel ]
]

{ #category : #export }
MCButton >> componentAttributeOn: anExporter [
	self isLink
		ifTrue: [ anExporter <<< ' mat-button ' ]
		ifFalse: [ anExporter <<< ' mat-stroked-button ' ]
]

{ #category : #export }
MCButton >> exportContentOf: aWidget with: anExporter [

	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :attribute | 
			anExporter inIndented: [ 
				anExporter
					indent;
					visit: attribute ] ].
	aWidget widgets do: [ :widget | 
		anExporter inIndented: [ anExporter visit: widget ] ]
]

{ #category : #accessing }
MCButton >> getSelector [
	self isLink ifTrue: [ ^ 'a' ].
	^ 'button'
]

{ #category : #accessing }
MCButton >> initialize [
	super initialize.
	isLink := false
]

{ #category : #accessing }
MCButton >> isLink [
	^ isLink
]

{ #category : #accessing }
MCButton >> isLink: aBoolean [
	isLink := aBoolean
]

{ #category : #accessing }
MCButton >> isNative [
	^ true
]

{ #category : #accessing }
MCButton >> isNotLink [
	isLink := false
]

{ #category : #accessing }
MCButton >> moduleName [
	^ 'MatButtonModule'
]

{ #category : #accessing }
MCButton >> modulePath [
	^ '@angular/material/button'
]
