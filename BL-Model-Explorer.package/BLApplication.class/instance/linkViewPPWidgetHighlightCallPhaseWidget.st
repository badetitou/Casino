accessing
linkViewPPWidgetHighlightCallPhaseWidget
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ (self linkWidgetName includes: cl widgetClass name) ifTrue: [ Color white  ] ifFalse: [ Color green ]  ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view	nodes:(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier)asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkWidgetFromPPPhase includes: e)
				ifTrue: [ Color blue ]
				ifFalse: [ Color gray ] ].
	view edges
		useAssociations:
			self linkWidgetFromPPPhase , self linkFromConstructor
				, (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link).
	view layout force strength: 0.6.
	view view pushBackEdges.
	^ view