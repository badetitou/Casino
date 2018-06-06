Extension { #name : #BLLinkButton }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLinkButton class >> canHandle: anInvocation [
	^ ('Button|BLLinkButton' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLinkButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #label
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	^ widget
]
