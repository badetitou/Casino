accessing
linkView
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			 (self modelPhases includes: cl)
				ifTrue: [ (self phaseCanStandalone: cl) ifTrue: [Color yellow] ifFalse: [Color blue ] ]
				ifFalse: [ Color red ] ].
	view nodes: (self modelPhases , self modelPageMetier ) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: (self phasesLink, self linkPageMetierAndPhaseConstructor  ).
	view layout force strength: 0.3.

	view view pushBackEdges.
	^ view