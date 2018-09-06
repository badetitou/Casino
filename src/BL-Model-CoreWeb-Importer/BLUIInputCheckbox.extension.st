Extension { #name : #BLUIInputCheckbox }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputCheckbox class >> canHandle: anInvocation [
	^ #('BLCheckBox' 'CheckBox') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputCheckbox class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'checkbox'.
	widget parameters at: #label put: (anInvocation parameters at: 1	ifAbsent: [ '' ]).
	widget parameters at: #labelPosition put: (anInvocation parameters at: 4 ifAbsent: [ '0' ]).
	^ widget
]
