actions
convertIfString: anObject
	anObject isString
		ifTrue: [ ^ '''' , (anObject copyReplaceAll: '''' with: '\''') , '''' ].
	^ anObject