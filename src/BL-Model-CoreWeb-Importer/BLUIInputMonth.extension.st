Extension { #name : #BLUIInputMonth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputMonth class >> canHandle: anInvocation [
	^ #('BLTextBoxPeriodePicker' 'BLTextBoxPeriode')
		includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputMonth class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'month'.
	^ widget
]
