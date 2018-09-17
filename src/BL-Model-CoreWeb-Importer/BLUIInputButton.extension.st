Extension { #name : #BLUIInputButton }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputButton class >> canHandle: anInvocation [
	^ #('Button' 'BLLinkButton') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputButton class >> createWidgetFor: anInvocation [
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
