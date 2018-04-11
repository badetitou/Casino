as yet unclassified
generatePhase
	xml nodesDo: [ :aXmlNode | 
			(aXmlNode isElement and: [ aXmlNode name localName = 'phase' ])
				ifTrue: [ self listOfPhases add: (self createPhaseInModel: aXmlNode) ] ]