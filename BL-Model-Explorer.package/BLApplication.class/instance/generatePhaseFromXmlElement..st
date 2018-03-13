accessing
generatePhaseFromXmlElement: xmlElement
	^ BLCAPhase new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ ((self model allModelClasses
						select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ]) at: 1)mooseName ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue)