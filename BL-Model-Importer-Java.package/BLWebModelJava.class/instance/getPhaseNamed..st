private
getPhaseNamed: aCodePhase
	^ (self listOfPhases select: [ :e | e codePhase = aCodePhase ])
		ifEmpty: [ Transcript crLog: 'error for ' , aCodePhase.
			^ nil ]
		ifNotEmpty: [ :a | a at: 1 ]