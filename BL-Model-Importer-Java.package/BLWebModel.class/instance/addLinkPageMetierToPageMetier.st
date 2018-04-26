adding
addLinkPageMetierToPageMetier 
	self linkPageMetierToPageMetier
		do: [ :assoc | self addTo: assoc key from: assoc value in: #metiers ]