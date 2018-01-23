accessing
phases
	^ phasesCache
		ifNil: [ | od |
			od := OrderedCollection new.
			self applicationXml
				nodesDo: [ :e | 
					e isElement
						ifTrue: [ e name localName = 'phase'
								ifTrue: [ od add: (self generatePhaseFromXmlElement: e) ] ] ].
			phasesCache := od ]