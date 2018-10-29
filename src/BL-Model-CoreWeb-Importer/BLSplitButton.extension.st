Extension { #name : #BLSplitButton }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLSplitButton class >> canHandle: anInvocation [
	^ 'BLSplitButton' = anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLSplitButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #label
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	BLModel createAttributeFrom: nil for: widget.
	^ widget
]
