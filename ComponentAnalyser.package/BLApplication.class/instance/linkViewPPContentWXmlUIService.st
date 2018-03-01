accessing
linkViewPPContentWXmlUIService
	| view lb |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelContentWidgetInstance includes: cl) ifTrue: [ Color green muchDarker ] ifFalse: [ 
			(self modelAsync includes: cl)
				ifTrue: [ Color tan muchDarker ]
				ifFalse: [ (self modelServices includes: cl)
						ifTrue: [ Color orange ]
						ifFalse: [ (self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
								ifTrue: [ (self linkWidgetName includes: cl widgetClass name)
										ifTrue: [ Color white ]
										ifFalse: [ Color green ] ]
								ifFalse: [ (self modelPhases includes: cl)
										ifTrue: [ (self phaseCanStandalone: cl)
												ifTrue: [ Color yellow ]
												ifFalse: [ Color blue ] ]
										ifFalse: [ Color red ] ] ] ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier , (self linkXmlUi collect: #key)
				, self modelServices , self modelAsync, self modelContentWidgetInstance) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkPhaseOrPageMetierToAsync includes: e)
				ifTrue: [ Color orange ]
				ifFalse: [ (self linkWidgetToService includes: e)
						ifTrue: [ Color orange ]
						ifFalse: [ (self linkWidgetFromPPPhase includes: e)
								ifTrue: [ Color blue ]
								ifFalse: [ Color gray ] ] ] ].
	view edges
		useAssociations:
			self linkWidgetFromPPPhase , self linkFromConstructor , (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link)
				, self linkWidgetToService, self linkXmlUiPhaseAndPageMetier, self linkPhaseOrPageMetierToAsync
				, (self modelContentWidgetInstance collect: #link).
	view layout force strength: 0.4.
	view view pushBackEdges.
	lb := RTLegendBuilder new.
	lb
		view: view view.
	lb addText: 'Legende'.
	lb addColor: Color white text: 'Widget Instance with "click" possibility'.
	lb addColor: Color green text: 'Widget Instance without "click" possibility'.
	lb addColor: Color yellow text: 'Standalone Phase'.
	lb addColor: Color blue text: 'Normal Phase'.
	lb addColor: Color red text: 'Page Metier'.
	lb addColor: Color orange text: 'Service'.
	lb addColor: Color tan muchDarker text: 'AsynchroneClass'.
	lb addLineColor: Color gray text: 'contain'.
	lb addLineColor: Color blue text: 'link action'.
	lb addLineColor: Color orange text: 'link from element to Service'.
	lb build.
	^ view