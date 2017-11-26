accessing
generatePhaseFromXmlElement: xmlElement
	^ BLPhase new
		realClassName: ((xmlElement attributeAt: #className) ifNotNil: [ :a | a replaceAllRegex: '\.' with: '::']);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue)