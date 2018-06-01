adding
addLinkForAbstractTabPhase
	self linkForAbstractTabPhase do: [ :assoc | (self getPhaseFromClass: assoc key) do: [ :phase | (self getPageMetierFromClass: assoc value) do: [ :pageMetier | phase pageMetiers add: pageMetier ] ] ]