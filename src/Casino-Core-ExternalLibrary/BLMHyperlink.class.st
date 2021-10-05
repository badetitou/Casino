Class {
	#name : #BLMHyperlink,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #testing }
BLMHyperlink >> exportContentOf: aWidget with: anExporter [

	anExporter
		crlf;
		indentPlus;
		indent.
	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :attribute | anExporter visit: attribute ].
	anExporter indentMinus.
	aWidget widgets do: [ :widget | 
		anExporter
			crlf;
			indentPlus.
		anExporter
			visit: widget;
			indentMinus ]
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
