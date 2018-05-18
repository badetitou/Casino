meta
createWidgetFor: anInvocation
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addWidget:
			(BLUILeaf new
				text:
					(anInvocation parameters
						at: 1
						ifAbsent: ['' ])).
	^ widget