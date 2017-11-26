accessing
generatePhaseFromXmlElement: xmlElement
	^ BLPhase new
		readClassName: (xmlElement attributeAt: #className);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue)