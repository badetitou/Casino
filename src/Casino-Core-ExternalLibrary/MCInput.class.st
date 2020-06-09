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
	#name : #MCInput,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCInput class >> componentAttributeOn: anExporter [
	anExporter <<< ' matInput '
]

{ #category : #export }
MCInput class >> exportContentOf: aWidget with: anExporter [
	anExporter
		indentPlus;
		<< '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter
		<<< '>';
		crlf;
		indentMinus
]

{ #category : #export }
MCInput class >> exportFooterOf: aWidget with: anExporter [
	anExporter << '</mat-form-field>'
]

{ #category : #export }
MCInput class >> exportHeaderOf: aWidget with: anExporter [
	anExporter
		<< '<mat-form-field appearance="fill">';
		crlf.
	aWidget attributes
		detect: [ :att | att isOfType: CSNUILabel ]
		ifFound: [ :att | 
			anExporter
				indentPlus;
				<< '<mat-label>';
				crlf;
				visit: att;
				crlf;
				<< '</mat-label>';
				indentMinus ]
]

{ #category : #accessing }
MCInput class >> getSelector [
	^ 'input'
]

{ #category : #accessing }
MCInput class >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #accessing }
MCInput class >> moduleName [
	^ 'MatInputModule'
]

{ #category : #accessing }
MCInput class >> modulePath [
	^ '@angular/material/input'
]
