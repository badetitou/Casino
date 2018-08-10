Extension { #name : #BLTextBoxPeriode }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxPeriode class >> canHandle: anInvocation [
	^ ('BLTextBoxPeriode|BLTextBoxPeriodePicker' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxPeriode class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #selectionMode put: 'range'.
	^ widget
]
