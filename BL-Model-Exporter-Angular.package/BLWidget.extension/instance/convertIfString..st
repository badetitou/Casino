*BL-Model-Exporter-Angular
convertIfString: anObject
	anObject isString
		ifTrue: [ ^ '''' , (anObject copyReplaceAll: ''''  with: '\''' ) , '''' ].
	^ anObject