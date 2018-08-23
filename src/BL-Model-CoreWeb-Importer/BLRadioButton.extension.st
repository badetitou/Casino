Extension { #name : #BLRadioButton }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLRadioButton class >> canHandle: anInvocation [
	^ 'BLRadioButton' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLRadioButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'radio'.
	widget parameters at: #name put: (anInvocation parameters at: 1 ifAbsent: [ self flag: #todo. 'todo' ]).
	widget parameters at: #label put: (anInvocation parameters	at: 2	ifAbsent: [ self flag: #todo. 'todo' ]).
	widget parameters at: #labelPosition put: (anInvocation parameters at: 5 ifAbsent: [ '0' ]).
	^ widget
]
