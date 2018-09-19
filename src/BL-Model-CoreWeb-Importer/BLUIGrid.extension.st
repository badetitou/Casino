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
	^ blAttributeClass ~= BLUIWidth and: [ blAttributeClass ~= BLEnable ]
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
	0 to: self widgets size do: [ :number | 
		| subset |
		(self atLevel: number)
			ifEmpty: [ subset := 12 ]
			ifNotEmpty: [ subset := 12 / (self atLevel: number) size.
				subset := subset < 1
					ifTrue: [ 1 ]
					ifFalse: [ subset floor ].
				(self atLevel: number) keys do: [ :widget | widget addAttribute: (BLGridSubElement new subpart: subset) ] ] ].
	
]
