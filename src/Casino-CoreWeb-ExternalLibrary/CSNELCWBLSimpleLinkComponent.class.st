Class {
	#name : #CSNELCWBLSimpleLinkComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #export }
CSNELCWBLSimpleLinkComponent >> exportContentOf: aWidget with: anExporter [
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
CSNELCWBLSimpleLinkComponent >> getSelector [
	^ 'bl-simple-link'
]

{ #category : #accessing }
CSNELCWBLSimpleLinkComponent >> moduleName [
	^ 'BlSimpleLinkComponent'
]

{ #category : #accessing }
CSNELCWBLSimpleLinkComponent >> subModulePath [
	^ '/components/link-button/simple-link/simple-link.component'
]
