Class {
	#name : #BLMAttachment,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
BLMAttachment >> exportContentOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<'.
	aWidget getListPropertiesAsStringWith: anExporter.
	anExporter
		<<< ' #';
		<<< (self variableFor: aWidget);
		<<< '>';
		crlf;
		indentMinus
]

{ #category : #accessing }
BLMAttachment >> exportFooterOf: aWidget with: anExporter [

	anExporter
		indentPlus;
		<< '<bl-attachment-chooser matSuffix [for]="';
		<<< (self variableFor: aWidget);
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
BLMAttachment >> moduleName [
	^ 'AttachmentModule'
]

{ #category : #accessing }
BLMAttachment >> modulePath [
	^ '@bl/elements'
]

{ #category : #accessing }
BLMAttachment >> variableFor: widget [
	^ widget affectedActions uniqueName
]
