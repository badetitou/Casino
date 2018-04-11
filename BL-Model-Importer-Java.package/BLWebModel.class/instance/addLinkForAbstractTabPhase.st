adding
addLinkForAbstractTabPhase
	self linkForAbstractTabPhase
		do: [ :assoc | (self getPhaseFromClass: assoc key) metiers add: (self getPageMetierFromClass: assoc value) ]