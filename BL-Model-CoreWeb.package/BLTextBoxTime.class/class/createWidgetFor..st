as yet unclassified
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget attributes at: #timeOnly put: 'true'.
	^ widget