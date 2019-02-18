Extension { #name : #CSNUIInputDate }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputDate class >> canHandle: anInvocation [
	^ #('BLTextBoxDate' 'BLTextBoxDatePicker') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputDate class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (CSNUIPlaceholder new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	widget parameters at: #type put: 'date'.
	^ widget
]
