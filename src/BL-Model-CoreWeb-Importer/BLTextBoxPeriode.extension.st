Extension { #name : #BLTextBoxPeriode }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxPeriode class >> canHandle: anInvocation [
	^ #('BLTextBoxPeriode' 'BLTextBoxPeriodePicker') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTextBoxPeriode class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #selectionMode put: 'range'.
	^ widget
]
