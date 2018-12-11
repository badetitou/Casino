Extension { #name : #BLUIInputDate }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputDate class >> canHandle: anInvocation [
	^ #('BLTextBoxDate' 'BLTextBoxDatePicker') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputDate class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (BLUIPlaceholder new text: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	widget parameters at: #type put: 'date'.
	^ widget
]
