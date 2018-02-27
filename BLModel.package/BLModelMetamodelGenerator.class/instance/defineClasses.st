definition
defineClasses
	phase := builder newClassNamed: #Phase.
	phaseStandalone := builder newClassNamed: #PhaseStandAlone.
	phaseNotStandalone := builder newClassNamed: #PhaseNotStandalone.
	pageMetier := builder newClassNamed: #PageMetier.
	widget := builder newClassNamed: #Widget.
	action := builder newClassNamed: #Action.
	actionAsynchrone := builder newClassNamed: #actionAsynchrone.
	actionAppel := builder newClassNamed: #actionAppel.
	service := builder newClassNamed: #Service.
	
	phase <|-- phaseStandalone.
	phase <|-- phaseNotStandalone.
	
	action <|-- actionAsynchrone.
	action <|-- actionAppel.