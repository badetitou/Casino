accessing
importPhases
	self applicationXml
		nodesDo: [ :e | 
			e isElement
				ifTrue: [ e name localName = 'phase'
						ifTrue: [ model add: (self generatePhaseFromXmlElement: e) ] ] ]