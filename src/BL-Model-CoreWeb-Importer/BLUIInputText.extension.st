Extension { #name : #BLUIInputText }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputText class >> canHandle: anInvocation [
	^ #('BLTextBox' 'TextBox' 'BLTextBoxRestricted') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputText class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.

	widget
		addAttribute: (BLUIPlaceholder new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	
	^ widget
]
