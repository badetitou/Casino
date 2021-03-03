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
	#name : #MCDatePicker,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCDatePicker >> exportContentOf: aWidget with: anExporter [
	anExporter
		indentPlus;
		<< '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter
		<<< ' [matDatepicker]="';
		<<< (self variableFor: aWidget);
		<<< '"';
		<<< '>';
		crlf;
		indentMinus
]

{ #category : #export }
MCDatePicker >> exportFooterOf: aWidget with: anExporter [
	anExporter
		<< '<mat-datepicker-toggle matSuffix [for]="';
		<<< (self variableFor: aWidget);
		<<< '"></mat-datepicker-toggle>';
		crlf;
		<< '<mat-datepicker #picker></mat-datepicker>';
		crlf;
		<< '</mat-form-field>'
]

{ #category : #export }
MCDatePicker >> exportHeaderOf: aWidget with: anExporter [
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
MCDatePicker >> getSelector [
	^ 'input'
]

{ #category : #accessing }
MCDatePicker >> internalDependencies [
	^ { MCDateAdapter new }
]

{ #category : #accessing }
MCDatePicker >> moduleName [
	^ 'MatDatepickerModule'
]

{ #category : #accessing }
MCDatePicker >> modulePath [
	^ '@angular/material/datepicker'
]

{ #category : #accessing }
MCDatePicker >> variableFor: widget [
	^ 'picker', widget mooseID printString
]
