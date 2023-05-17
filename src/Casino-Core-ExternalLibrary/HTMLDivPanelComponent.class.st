"
A special implementation to customize the export of panel as div dealing with incorrect attribute to ensure export compiling
"
Class {
	#name : #HTMLDivPanelComponent,
	#superclass : #HTMLComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
HTMLDivPanelComponent >> attributeOf: aWidget with: anExporter [

	^ (super attributeOf: aWidget with: anExporter) flattened reject: [ :attribute | "Label can not be use in <div>" 
		  attribute isKindOf: CSNUILabel ]
]

{ #category : #accessing }
HTMLDivPanelComponent >> exportContentOf: aWidget with: anExporter [

	aWidget attributes
		detect: [ :attribute | attribute isOfType: CSNUILabel ]
		ifFound: [ :attribute | 
			anExporter
				indentPlus;
				eol;
				indent;
				visit: attribute;
				indentMinus ].
	super exportContentOf: aWidget with: anExporter
]
