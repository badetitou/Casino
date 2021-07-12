Class {
	#name : #CSNELCWBLListAndDetailsComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLListAndDetailsComponent >> exportContentOf: aWidget with: anExporter [
	anExporter
		indentPlus;
		crlf;
		<< '<span slot="bl-panel-criteres-body">';
		indentPlus;
		crlf.
	aWidget widgets
		do: [ :widget | 
			anExporter
				crlf;
				indentPlus.
			anExporter
				visit: widget;
				indentMinus ].
	anExporter
		indentMinus;
		crlf;
		<< '</span>';
		indentMinus
]

{ #category : #accessing }
CSNELCWBLListAndDetailsComponent >> getSelector [
	^ 'bl-liste-et-detail'
]

{ #category : #accessing }
CSNELCWBLListAndDetailsComponent >> moduleName [
	^ 'ListeEtDetailComponent'
]

{ #category : #accessing }
CSNELCWBLListAndDetailsComponent >> subModulePath [
	^ '/components/liste-et-detail/liste-et-detail.component'
]
