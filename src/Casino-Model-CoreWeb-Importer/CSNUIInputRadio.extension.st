Extension { #name : #CSNUIInputRadio }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputRadio class >> canHandle: anInvocation [
	^ 'BLRadioButton' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputRadio class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'radio'.
	widget addAttribute: (CSNUIName new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ self flag: #todo. 'todo' ])).
	widget addAttribute: (CSNUILabel new attributeValue: (anInvocation parameters	at: 2	ifAbsent: [ self flag: #todo. 'todo' ])).
	widget parameters at: #labelPosition put: (anInvocation parameters at: 5 ifAbsent: [ '0' ]).
	^ widget
]
