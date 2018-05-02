as yet unclassified
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters
		at: #multiple
		put: 'multiple'.
	^ widget