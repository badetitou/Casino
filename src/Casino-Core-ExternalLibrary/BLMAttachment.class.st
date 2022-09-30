Class {
	#name : #BLMAttachment,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
BLMAttachment >> attributeOf: aWidget [

	| attributes |
	"Same as super class but MUST have a CSNUIID"
	attributes := aWidget computeSelfAttributes.
	attributes add: (CSNUIId new attributeValue: aWidget id).
	^ attributes
]

{ #category : #accessing }
BLMAttachment >> exportContentOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<'.
	self exportListPropertiesOf: aWidget asStringWith: anExporter.
	anExporter
		<<< ' #';
		<<< aWidget id;
		<<< '>'
]

{ #category : #accessing }
BLMAttachment >> exportFooterOf: aWidget with: anExporter [

	anExporter
		<<< '</';
		<<< (aWidget getSelectorFrom: anExporter);
		<<< '>'.
	anExporter
		crlf;
		<< '<bl-attachment-chooser matSuffix [for]="';
		<<< aWidget id;
		<<< '"></bl-attachment-chooser>';
		crlf;
		indentMinus;
		<< '</mat-form-field>'
]

{ #category : #accessing }
BLMAttachment >> exportHeaderOf: aWidget with: anExporter [
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
BLMAttachment >> getSelector [
	^ 'bl-attachment'
]

{ #category : #accessing }
BLMAttachment >> internalDependenciesOf: aWidgetInstance [
	^ { MCFormFieldModule new }
]

{ #category : #accessing }
BLMAttachment >> moduleName [
	^ 'AttachmentModule'
]

{ #category : #accessing }
BLMAttachment >> modulePath [

	^ '@bl/elements'
]

{ #category : #accessing }
BLMAttachment >> variableFor: widget [

	^ widget id
]
