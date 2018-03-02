accessing
linkView
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstance includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier
				, (self modelWidgetInstance reject: [ :el | self widgetNamespace match: el link key mooseName])) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: self phasesLink , self linkFromConstructor , (self modelWidgetInstance collect: #link).
	view layout force strength: 0.2.
	view view pushBackEdges.
	^ view