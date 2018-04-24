*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation. 
	widget attributes at: #title put: (anInvocation parameters at: 1).
	^ widget