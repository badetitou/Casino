Extension { #name : #BLFieldset }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldset class >> canHandle: anInvocation [
	^ 'BLFieldSetPanel' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLFieldset class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #title
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	^ widget
]
