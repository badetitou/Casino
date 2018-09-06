Extension { #name : #BLInputText }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLInputText class >> canHandle: anInvocation [
	^ #('BLTextBox' 'TextBox') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLInputText class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		text:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'TODO' ]).
	widget
		valueLabel:
			(anInvocation parameters
				at: 4
				ifAbsent: [ self flag: #todo.
					'' ]).
	^ widget
]
