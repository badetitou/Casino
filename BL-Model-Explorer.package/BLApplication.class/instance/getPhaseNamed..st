accessing
getPhaseNamed: aClassName
	^ ((self phases select: [ :e | e codePhase = aClassName  ]) ifEmpty: [ Transcript crLog: 'error for ', aClassName .^nil ] ifNotEmpty: [ :a | a at: 1]) realClassName