as yet unclassified
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #timeOnly put: 'true'.
	^ widget