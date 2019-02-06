Extension { #name : #CSNUIInputMonth }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputMonth class >> canHandle: anInvocation [
	^ #('BLTextBoxPeriodePicker' 'BLTextBoxPeriode')
		includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputMonth class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'month'.
	^ widget
]
