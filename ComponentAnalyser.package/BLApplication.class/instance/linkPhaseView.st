accessing
linkPhaseView
	| view |
	view := RTMondrian new.
	view shape circle color: Color blue lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter .
	(view nodes: (self modelPhases) asSet).
	(view shape line arrowedLine headOffset: 1.0) shape head baseSize: 5.0; size: 8.
	view edges useAssociations: self phasesLink.
	view layout force.
	view view pushBackEdges.
	^ view