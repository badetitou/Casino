initialization
addLinkXmlUiFrom: aBlApplication
	aBlApplication linkXmlUiPhaseAndPageMetier
		do: [ :assoc |
			| a |
			a := (self getPhaseFromClass: assoc value).
			a ifNil: [ a := (self getPageMetierFromClass: assoc value). ].
			a metiers
				add: (self getPageMetierFromClass: assoc key)  ]