Extension { #name : #CSNUIInputText }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputText class >> canHandle: anInvocation [
	^ #('BLTextBox' 'TextBox' 'BLTextBoxRestricted') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputText class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.

	widget
		addAttribute: (CSNUIPlaceholder new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	
	^ widget
]
