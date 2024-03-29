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
	#name : #MCSelect,
	#superclass : #MaterialComponent,
	#instVars : [
		'multiple'
	],
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCSelect >> beMultiple [

	self multiple: true
]

{ #category : #accessing }
MCSelect >> componentAttributeOn: anExporter [

	self multiple ifTrue: [ anExporter <<< ' multiple' ]
]

{ #category : #accessing }
MCSelect >> exportFooterOf: aWidget with: anExporter [

	super exportFooterOf: aWidget with: anExporter.
	anExporter
		indentMinus;
		eol;
		<< '</mat-form-field>'
]

{ #category : #accessing }
MCSelect >> exportHeaderOf: aWidget with: anExporter [

	anExporter
		<< '<mat-form-field appearance="fill">';
		indentPlus;
		eol.
	aWidget attributes
		detect: [ :att | att isOfType: CSNUILabel ]
		ifFound: [ :att | 
			anExporter
				<< '<mat-label>';
				visit: att;
				<<< '</mat-label>';
				eol ].
	super exportHeaderOf: aWidget with: anExporter
]

{ #category : #accessing }
MCSelect >> getSelector [
	^ 'mat-select'
]

{ #category : #accessing }
MCSelect >> initialize [
	super initialize.
	multiple := false
]

{ #category : #accessing }
MCSelect >> moduleName [
	^ 'MatSelectModule'
]

{ #category : #accessing }
MCSelect >> modulePath [
	^ '@angular/material/select'
]

{ #category : #accessing }
MCSelect >> multiple [

	^ multiple
]

{ #category : #accessing }
MCSelect >> multiple: anObject [

	multiple := anObject
]
