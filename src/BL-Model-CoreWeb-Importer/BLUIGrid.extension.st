Extension { #name : #BLUIGrid }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	self addAttribute: (BLGridElement newFor: self)
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| param |
	param := anInvocation parameters.
	(self privateState attributeAt: #widgetPosition ifAbsentPut: [ Dictionary new ])
		add:
			aWidget ->
					{(param at: 1) asInteger ifNil: [0].
					(param at: 2) asInteger}.
	self addWidget: aWidget
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid class >> canHandle: anInvocation [
	^ #('BLFlexTable' 'BLGrid') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLWidth and: [ blAttributeClass ~= BLEnable ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	^ widget
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGrid >> postImport [
	super postImport.
	"((self privateState attributes asDictionary at: #widgetPosition ifAbsent: [{} asOrderedCollection]) groupedBy: [:el | el value at: 1]) do: [:collection | collection do: [ :el | el key addAttribute: (BLGridSubElement new subpart: 12/(collection size)) ] ].
	"
]
