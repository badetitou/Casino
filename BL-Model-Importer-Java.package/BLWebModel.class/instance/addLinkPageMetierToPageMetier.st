adding
addLinkPageMetierToPageMetier
	self linkPageMetierToPageMetier
		do:
			[ :assoc | ( assoc key) metiers add: ( assoc value) ]