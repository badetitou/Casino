Class {
	#name : #MCPanel,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCPanel >> exportFooterOf: aWidget with: anExporter [

	anExporter
		eol;
		<< '</'.
	(aWidget layout isNotNil and: [ aWidget layout specificSelector ])
		ifTrue: [ anExporter <<< aWidget layout getSelector ]
		ifFalse: [ anExporter <<< self getSelector ].
	anExporter <<< '>'
]

{ #category : #accessing }
MCPanel >> exportListPropertiesOf: aWidget asStringWith: anExporter [

	(aWidget layout isNotNil and: [ aWidget layout specificSelector ])
		ifTrue: [ anExporter <<< aWidget layout getSelector ]
		ifFalse: [ anExporter <<< self getSelector ].
	self componentAttributeOn: anExporter forWidget: aWidget.
	self componentActionsOn: anExporter forWidget: aWidget
	"anExporter <<< aWidget idTag"
]

{ #category : #'accessing - testing' }
MCPanel >> isLocal [

	^ false
]

{ #category : #'accessing - testing' }
MCPanel >> isNative [

	"The widget is part of the html standard"

	^ true
]
