as yet unclassified
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #header
		put:
			(anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	^ widget