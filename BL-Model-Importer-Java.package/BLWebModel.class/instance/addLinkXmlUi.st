adding
addLinkXmlUi
	xmlUiLink := self linkXmlUiPhaseAndPageMetier asDictionary reverse
	"do: [ :assoc |
			| from to  |
			from := (self getPhaseFromClass: assoc value).
			from ifNil: [ from := (self getPageMetierFromClass: assoc value). ].
			to := (self getPageMetierFromClass: assoc key).
			to ifNil: [ from metiers
				add: (self getPhaseFromClass: assoc value) ] ifNotNil: [ from metiers
				add: to ] ]"