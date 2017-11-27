accessing
phasesLink
	| blLink |
	blLink := ((self modelPhases collect: #attributes thenSelect: [ :e | e size ~= 0 ])
		flatCollect: [ :e | (e collect: #declaredType) flatCollect: #outgoingInvocationsGroup ])
		collect: [ :e | 
			((self phases collect: #codePhase) includes: (e signature replaceAllRegex: '\(\)' with: ''))
				ifTrue: [ Association  new
						key: e sender parentType container
						value: (self getPhaseClassFrom: (self getPhaseNamed: (e signature replaceAllRegex: '\(\)' with: ''))) ] ]
		thenSelect: #isNotNil.
	^ blLink