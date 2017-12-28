accessing
searchFirstNotAnonymousClassFor: e
	| tmp |
	tmp := e sender belongsTo.
	[ tmp isAnonymousClass ] whileTrue: [ tmp := tmp belongsTo belongsTo ].
	^ tmp