*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget parameters at: #style put: 'display: inline-flex;'.
	^ widget