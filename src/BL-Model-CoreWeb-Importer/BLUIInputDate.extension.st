Extension { #name : #BLUIInputDate }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputDate >> addDefaultAttribute [
	"black magic... Can send nil
	see BLHorizontalParent>>newFrom:for:"

	"self addAttribute: (BLCalendarShowIcon newFor: self)"
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputDate class >> canHandle: anInvocation [
	^ #('BLTextBoxDate' 'BLTextBoxDatePicker') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputDate class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'date'.
	^ widget
]
