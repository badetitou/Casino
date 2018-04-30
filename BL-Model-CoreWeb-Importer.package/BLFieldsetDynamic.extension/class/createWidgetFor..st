*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget attributes at: #toggleable put: 'true'.
	^ widget