accessing
searchFirstNotAnonymousClassForClass: e
	| tmp |
	tmp := e.
	[ tmp isAnonymousClass ] whileTrue: [ tmp := tmp belongsTo belongsTo ].
	^ tmp