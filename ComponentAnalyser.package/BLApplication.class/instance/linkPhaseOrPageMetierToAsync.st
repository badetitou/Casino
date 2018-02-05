accessing
linkPhaseOrPageMetierToAsync
	^ self modelAsync
		collect: [ :asyncClass | 
			Association new
				key: asyncClass
				value: (self searchFirstNotAnonymousClassForClass: asyncClass) ]