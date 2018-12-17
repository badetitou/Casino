Extension { #name : #BLUIInputRadio }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputRadio class >> canHandle: anInvocation [
	^ 'BLRadioButton' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputRadio class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'radio'.
	widget addAttribute: (BLUIName new attributeValue: (anInvocation parameters at: 1 ifAbsent: [ self flag: #todo. 'todo' ])).
	widget addAttribute: (BLUILabel new attributeValue: (anInvocation parameters	at: 2	ifAbsent: [ self flag: #todo. 'todo' ])).
	widget parameters at: #labelPosition put: (anInvocation parameters at: 5 ifAbsent: [ '0' ]).
	^ widget
]
