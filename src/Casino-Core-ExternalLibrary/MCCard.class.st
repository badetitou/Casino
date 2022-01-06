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
	#name : #MCCard,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCCard >> attributeOf: aWidget [

	^ (super attributeOf: aWidget) flattened reject: [ :attribute | "Title is used in the header" 
		  attribute isKindOf: CSNUITitle ]
]

{ #category : #export }
MCCard >> exportFooterOf: aWidget with: anExporter [
	anExporter
		crlf;
		<< '</mat-card-content>';
		indentMinus;
		crlf;
		<< '</';
		<<< (aWidget getSelectorFrom: anExporter);
		<<< '>'
]

{ #category : #export }
MCCard >> exportHeaderOf: aWidget with: anExporter [
	anExporter << '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter <<< '>'.
	anExporter
		indentPlus;
		crlf;
		<< '<mat-card-header>';
		indentPlus;
		crlf;
		<< '<mat-card-title>'.
	aWidget attributes detect: [ :a | a isOfType: CSNUITitle ] ifFound: [ :attribute | anExporter visit: attribute ].
	anExporter
		<<< '</mat-card-title>';
		crlf;
		indentMinus;
		<< '</mat-card-header>';
		crlf;
		<< '<mat-card-content>'
]

{ #category : #accessing }
MCCard >> getSelector [
	^ 'mat-card'
]

{ #category : #accessing }
MCCard >> moduleName [
	^ 'MatCardModule'
]

{ #category : #accessing }
MCCard >> modulePath [
	^ '@angular/material/card'
]
