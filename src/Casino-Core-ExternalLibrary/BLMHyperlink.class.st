Class {
	#name : #BLMHyperlink,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #testing }
BLMHyperlink >> angularActionRepresentationOf: action forWidget: aWidget using: anExporter [

	(aWidget additionalActions includes: action) ifTrue: [ ^ nil ].
	^ anExporter <<< (action getAngularRepresentationWith: anExporter)
]

{ #category : #testing }
BLMHyperlink >> exportContentOf: aWidget with: anExporter [

	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :attribute | 
			anExporter
				indentPlus;
				crlf;
				indent;
				visit: attribute;
				indentMinus ].
	aWidget widgets do: [ :widget | 
		anExporter
			crlf;
			indentPlus.
		anExporter
			visit: widget;
			indentMinus ]
]

{ #category : #export }
BLMHyperlink >> exportHeaderOf: aWidget with: anExporter [

	aWidget additionalActions
		do: [ :action | 
			anExporter
				<< '<i class="ph-file-light" (click)="openPhase(';
				<<< action call getAcceptedName;
				<<< ')"></i>';
				crlf ]
		separatedBy: [ anExporter crlf ].
	super exportHeaderOf: aWidget with: anExporter
]

{ #category : #testing }
BLMHyperlink >> getSelector [
	^ 'bl-hyperlink'
]

{ #category : #testing }
BLMHyperlink >> moduleName [

	^ 'HyperlinkModule'
]

{ #category : #testing }
BLMHyperlink >> modulePath [

	^ '@bl/elements'
]
