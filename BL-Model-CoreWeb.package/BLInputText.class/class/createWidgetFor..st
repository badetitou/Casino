meta
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget text: (anInvocation parameters
						at: 1
						ifAbsent: [ self flag: #todo.
							'TODO' ]).
	^ widget