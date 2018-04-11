adding
addLinkPhaseToPageMetier
	(self computeAllConstructorsLink
		collect: [ :a | (self getPhaseFromClass: a key) -> (self getPageMetierFromClass: a value) ]
		thenSelect: [ :a | a key isNotNil and: [ a value isNotNil ] ])
		do: [ :assoc | assoc key metiers add: assoc value ]