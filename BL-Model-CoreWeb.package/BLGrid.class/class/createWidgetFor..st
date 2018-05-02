as yet unclassified
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters 	at: #class
		put:
		'ui-g'.
	^ widget