meta
createWidgetFor: anInvocation
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