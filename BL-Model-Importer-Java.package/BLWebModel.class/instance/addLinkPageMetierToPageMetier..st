initialization
addLinkPageMetierToPageMetier: aBlApplication
	aBlApplication linkPageMetierToPageMetier
		do:
			[ :assoc | (self getPageMetierFromClass: assoc key) metiers add: (self getPageMetierFromClass: assoc value) ]