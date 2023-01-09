Class {
	#name : #MCAutocomplete,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCAutocomplete >> attributeOf: aWidget with: anExporter [

	| attributes |
	attributes := super attributeOf: aWidget with: anExporter.
	attributes add: (CSNAttribute new
			 name: 'formControlName';
			 attributeValue: aWidget id;
			 yourself).
	^ attributes
]

{ #category : #accessing }
MCAutocomplete >> componentAttributeOn: anExporter [
	anExporter <<< ' type="text" matInput [matAutocomplete]="auto"'
]

{ #category : #accessing }
MCAutocomplete >> exportContentOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter
		<<< '>';
		crlf;
		<< '<mat-autocomplete #auto="matAutocomplete">'.
		anExporter inIndented: [ anExporter << '<!-- mat-option *ngtFor="let option of currentResult" -->' ].
	anExporter
		<< '</mat-autocomplete>';
		crlf;
		indentMinus
]

{ #category : #accessing }
MCAutocomplete >> exportFooterOf: aWidget with: anExporter [
	anExporter << '</mat-form-field>'
]

{ #category : #accessing }
MCAutocomplete >> exportHeaderOf: aWidget with: anExporter [
	anExporter
		<< '<mat-form-field class="research-full-width" appearance="fill">';
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
MCAutocomplete >> getSelector [
	^ 'input'
]

{ #category : #accessing }
MCAutocomplete >> internalDependenciesOf: aWidgetInstance [

	^ { 
		  MCFormFieldModule new.
		  MCInput new }
]

{ #category : #accessing }
MCAutocomplete >> isFormControl [
	"If true this representation support the formControl"
	^ true
]

{ #category : #accessing }
MCAutocomplete >> moduleName [
	^ 'MatAutocompleteModule'
]

{ #category : #accessing }
MCAutocomplete >> modulePath [
	^ '@angular/material/autocomplete'
]
