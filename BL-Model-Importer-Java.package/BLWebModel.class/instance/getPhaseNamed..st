private
getPhaseNamed: aClassName
	^ ((self listOfPhases select: [ :e | e codePhase = aClassName  ]) ifEmpty: [ Transcript crLog: 'error for ', aClassName .^nil ] ifNotEmpty: [ :a | a at: 1]) realClassName