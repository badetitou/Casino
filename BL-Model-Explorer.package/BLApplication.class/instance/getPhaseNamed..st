accessing
getPhaseNamed: aClassName
	^ ((self phases select: [ :e | e codePhase = aClassName  ]) at: 1) realClassName