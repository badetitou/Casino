Extension { #name : #BLUIButton }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIButton class >> canHandle: anInvocation [
	^ #('Button' 'BLLinkButton') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (BLUILabel new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	^ widget
]
