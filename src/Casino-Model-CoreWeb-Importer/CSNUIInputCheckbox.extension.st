Extension { #name : #CSNUIInputCheckbox }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputCheckbox class >> canHandle: anInvocation [
	^ #('BLCheckBox' 'CheckBox') includes: anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputCheckbox class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'checkbox'.
	widget addAttribute: (CSNUILabel new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	widget parameters at: #labelPosition put: (anInvocation parameters at: 4 ifAbsent: [ '0' ]).
	^ widget
]
