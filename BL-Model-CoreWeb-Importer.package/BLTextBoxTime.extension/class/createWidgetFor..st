*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #timeOnly put: 'true'.
	^ widget