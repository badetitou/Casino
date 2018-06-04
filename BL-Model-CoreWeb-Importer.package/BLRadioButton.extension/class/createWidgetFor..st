*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #type put: 'radio'.
	widget parameters at: #name put: (anInvocation parameters
				at: 1
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	widget parameters at: #label put: (anInvocation parameters
				at: 2
				ifAbsent: [ self flag: #todo.
					'todo' ]).
	^ widget