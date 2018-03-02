initialization
addLinkForAbstractTabPhaseFrom: aBlApplication
	aBlApplication linkForAbstractTabPhase
		do: [ :assoc | (self getPhaseFromClass: assoc key) metiers add: (self getPageMetierFromClass: assoc value) ]