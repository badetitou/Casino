adding
addLinkPhaseToPageMetier
	(self computeAllConstructorsLink
		collect: [ :a | (self getPhaseFromClass: a key) -> (self getPageMetierFromClass: a value) ]
		thenSelect: [ :a | a key isNotNil and: [ a value isNotNil ] ])
		do:
			[ :assoc | self addTo: assoc key from: assoc value in: #metiers	"assoc key do: [ :from | from metiers add: assoc value ]" ]