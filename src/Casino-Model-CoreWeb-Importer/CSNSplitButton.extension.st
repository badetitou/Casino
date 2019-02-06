Extension { #name : #CSNSplitButton }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNSplitButton class >> canHandle: anInvocation [
	^ 'BLSplitButton' = anInvocation invokedClassName
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNSplitButton class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #label
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	CSNModel createAttributeFrom: nil for: widget.
	^ widget
]
