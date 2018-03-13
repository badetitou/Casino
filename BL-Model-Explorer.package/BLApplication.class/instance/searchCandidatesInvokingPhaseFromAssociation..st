accessing
searchCandidatesInvokingPhaseFromAssociation: e
	| tmp |
	tmp := e sender belongsTo.
	[ tmp belongsTo isNamespace ] whileFalse: [ tmp := tmp  belongsTo ].
	(self modelPhases includes: tmp)
		ifTrue: [ ^ (({{tmp} asOrderedCollection . tmp subInheritances collect: [ :a | a value to ] } asOrderedCollection) select: #isNotEmpty) flatten asSet  ].
	^ tmp incomingReferences collect: [ :a |  a source belongsTo ]