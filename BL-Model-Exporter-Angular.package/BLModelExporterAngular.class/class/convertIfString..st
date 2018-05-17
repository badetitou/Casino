actions
convertIfString: anObject
	anObject isString
		ifTrue: [ ^ '"' , anObject protectQuote , '"' ].
	^ anObject 