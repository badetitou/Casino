accessing
linkPhaseView
	| view |
	view := RTMondrian new.
	view shape circle if: [ :each | each isAnnotatedWith: 'Deprecated' ] color: Color red.
	view nodes: (self modelPhases) asSet.
	view edges useAssociations: self phasesLinkTrue.
	view layout force.
	view view pushBackEdges.
	^ view