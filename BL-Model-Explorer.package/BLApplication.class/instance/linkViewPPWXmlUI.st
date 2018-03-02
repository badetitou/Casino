accessing
linkViewPPWXmlUI
	| view lb |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ (self linkWidgetName includes: cl widgetClass name)
						ifTrue: [ Color white ]
						ifFalse: [ Color green ] ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view nodes: (self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier , (self linkXmlUi collect: #key)) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkWidgetFromPPPhase includes: e)
				ifTrue: [ Color blue ]
				ifFalse: [ Color gray ] ].
	view edges useAssociations: self linkWidgetFromPPPhase , self linkFromConstructor , (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link), self linkXmlUi.
	view layout force strength: 0.4.
	view view pushBackEdges.
		lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor:  Color white text: 'Widget Instance with "click" possibility'.
	lb addColor: Color green text: 'Widget Instance without "click" possibility'.
	lb addColor: Color yellow text: 'Standalone Phase'.
	lb addColor: Color blue text: 'Normal Phase'.
	lb addColor: Color red text: 'Page Metier'.
	lb addLineColor: Color gray text: 'contain'.
	lb addLineColor: Color blue text: 'link action'.
	lb build.
	
	^ view