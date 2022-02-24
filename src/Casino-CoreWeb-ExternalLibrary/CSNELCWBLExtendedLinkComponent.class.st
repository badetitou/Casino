Class {
	#name : #CSNELCWBLExtendedLinkComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #export }
CSNELCWBLExtendedLinkComponent >> exportContentOf: aWidget with: anExporter [
	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :label | 
			anExporter
				crlf;
				indentPlus;
				indent;
				visit: label;
				indentMinus ].
	aWidget widgets
		do: [ :widget | 
			anExporter
				crlf;
				indentPlus.
			anExporter
				visit: widget;
				indentMinus ]
]

{ #category : #accessing }
CSNELCWBLExtendedLinkComponent >> getSelector [
	^ 'bl-extended-link'
]

{ #category : #accessing }
CSNELCWBLExtendedLinkComponent >> moduleName [
	^ 'BlExtendedLinkComponent'
]

{ #category : #accessing }
CSNELCWBLExtendedLinkComponent >> subModulePath [
	^ '/components/link-button/extended-link/extended-link.component'
]
