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

{ #category : #accessing }
MCDatePicker >> attributeOf: aWidget with: anExporter [

	| attributes |
	attributes := super attributeOf: aWidget with: anExporter.
	attributes add: (CSNAttribute new
			 name: 'formControlName';
			 attributeValue: aWidget id;
			 yourself).
	^ attributes
]

{ #category : #export }
MCDatePicker >> exportContentOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter
		<<< ' matInput [matDatepicker]="';
		<<< (self variableFor: aWidget);
		<<< '"';
		<<< '>';
		eol;
		indentMinus
]

{ #category : #export }
MCDatePicker >> exportFooterOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<mat-datepicker-toggle matSuffix [for]="';
		<<< (self variableFor: aWidget);
		<<< '"></mat-datepicker-toggle>';
		eol;
		<< '<mat-datepicker #';
		<<< (self variableFor: aWidget);
		<<< '></mat-datepicker>';
		eol;
		indentMinus;
		<< '</mat-form-field>'
]

{ #category : #export }
MCDatePicker >> exportHeaderOf: aWidget with: anExporter [
	anExporter
		<< '<mat-form-field appearance="fill">';
		eol.
	aWidget attributes
		detect: [ :att | att isOfType: CSNUILabel ]
		ifFound: [ :att | 
			anExporter
				indentPlus;
				<< '<mat-label>';
				eol;
				visit: att;
				eol;
				<< '</mat-label>';
				indentMinus ]
]

{ #category : #export }
MCDatePicker >> exportListPropertiesOf: aWidget asStringWith: anExporter [

	anExporter <<< self getSelector.
	self componentAttributeOn: anExporter forWidget: aWidget.
	anExporter <<< (aWidget actionsTagFrom: anExporter)
]

{ #category : #accessing }
MCDatePicker >> getSelector [
	^ 'input'
]

{ #category : #accessing }
MCDatePicker >> internalDependenciesOf: aWidgetInstance [

	^ { 
		  MCDateAdapter new.
		  MCFormFieldModule new }
]

{ #category : #accessing }
MCDatePicker >> isFormControl [
	"If true this representation support the formControl"
	^ true
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
	^ widget id
]
