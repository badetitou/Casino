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
		anExporter inIndented: [ anExporter visit: attribute ] ].
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
				<<
					'<span class="fa-stack fa-2xs" style="vertical-align: top; float: right;" (click)="openPhase(';
				<<< action call name;
				<<< ')">';
				inIndented: [ 
					anExporter
						<< '<i class="fa-regular fa-circle fa-stack-2x"></i>';
						crlf;
						<< '<i class="fa-solid fa-file fa-stack-1x"></i>' ];
				<< '</span>';
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

	^ '@bl-microfront/elements'
]
