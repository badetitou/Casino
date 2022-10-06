Class {
	#name : #CSNELCWBLExtendedLinkComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLExtendedLinkComponent >> angularActionRepresentationOf: action forWidget: aWidget using: anExporter [

	(aWidget additionalActions includes: action) ifTrue: [ 
		^ anExporter
			  <<< '(clickSecondLink)="openPhase(';
			  <<< action call getAcceptedName;
			  <<< ')"' ].
	(action isKindOf: CSNActionAppel) ifTrue: [ ^ anExporter
			  <<< '(clickMainLink)="openPhase(';
			  <<< action call name;
			  <<< ')"' ].
	^ anExporter <<< (action getAngularRepresentationWith: anExporter)
]

{ #category : #accessing }
CSNELCWBLExtendedLinkComponent >> attributeOf: aWidget [

	| attributes |
	attributes := super attributeOf: aWidget.
	(aWidget actions anySatisfy: [ :action | 
		 aWidget additionalActions includes: action ]) ifTrue: [ 
		attributes := attributes , { (CSNAttribute new
			               name: '[secondLink]';
			               attributeValue: 'true') } ].
	^ attributes
]

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
