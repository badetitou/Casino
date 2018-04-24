model
containerWidget: aBLWidget
	containerWidget := FMMultivalueLink
		on: self
		update: #widgets
		from: self containerWidget
		to: aBLWidget