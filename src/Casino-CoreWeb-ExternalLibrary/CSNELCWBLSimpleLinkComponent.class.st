Class {
	#name : #CSNELCWBLSimpleLinkComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #'as yet unclassified' }
CSNELCWBLSimpleLinkComponent class >> exportContentOf: aWidget with: anExporter [
	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :label | 
			anExporter
				crlf;
				indentPlus;
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

{ #category : #'as yet unclassified' }
CSNELCWBLSimpleLinkComponent class >> getSelector [
	^ 'bl-simple-link'
]

{ #category : #accessing }
CSNELCWBLSimpleLinkComponent class >> moduleName [
	^ 'BlSimpleLinkComponent'
]

{ #category : #'as yet unclassified' }
CSNELCWBLSimpleLinkComponent class >> subModulePath [
	^ 'link-button/simple-link/simple-link.component'
]
