initialization
containerMetier: containersMetier
	containerMetier := FMMultivalueLink
		on: self
		update: #metiers
		from: self containerMetier
		to: containersMetier
		