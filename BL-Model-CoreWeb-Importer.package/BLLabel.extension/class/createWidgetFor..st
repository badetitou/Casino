*BL-Model-CoreWeb-Importer
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget widgets add: (BLUILeaf new text: (anInvocation parameters at: 1 ifAbsent: [ self flag: #todo. 'TODO'] )).
	^ widget