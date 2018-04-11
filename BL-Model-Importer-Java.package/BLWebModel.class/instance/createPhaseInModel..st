as yet unclassified
createPhaseInModel: xmlElement
	| blPhase |
	blPhase := BLPhase new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ ((self sourceModel allModelClasses
						select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ]) at: 1) mooseName ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue);
		name: (xmlElement attributeAt: #codeValue).
	blPhase source: (self getClassNamed: blPhase realClassName).
	^ blPhase