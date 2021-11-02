Class {
	#name : #MCTextArea,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCTextArea >> componentAttributeOn: anExporter [
	anExporter <<< ' matInput '
]

{ #category : #export }
MCTextArea >> exportContentOf: aWidget with: anExporter [
	anExporter
		indentPlus;
		<< '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter
		<<< '>';
		crlf;
		indentMinus
]

{ #category : #export }
MCTextArea >> exportFooterOf: aWidget with: anExporter [
	anExporter << '</mat-form-field>'
]

{ #category : #export }
MCTextArea >> exportHeaderOf: aWidget with: anExporter [
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
MCTextArea >> getSelector [
	^ 'textarea'
]

{ #category : #export }
MCTextArea >> internalDependenciesOf: aWidgetInstance [
	^ { MCFormFieldModule new }
]

{ #category : #accessing }
MCTextArea >> isNative [
	"The widget is part of the html standard"
	^ true
]

{ #category : #accessing }
MCTextArea >> moduleName [
	^ 'MatInputModule'
]

{ #category : #accessing }
MCTextArea >> modulePath [
	^ '@angular/material/input'
]
