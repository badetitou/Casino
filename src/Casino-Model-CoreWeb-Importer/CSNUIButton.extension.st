Extension { #name : #CSNUIButton }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIButton class >> canHandle: anInvocation [
	^ #('Button' 'BLLinkButton') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget addAttribute: (CSNUILabel new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	^ widget
]
