Extension { #name : #BLLinkLabel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLinkLabel class >> canHandle: anInvocation [
	^ 'BLLinkLabel' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLinkLabel class >> createWidgetFor: anInvocation [
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
