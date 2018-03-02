accessing
searchCalledPhase: e
	^ self
		getPhaseClassFrom:
			(self
				getPhaseNamed: (e previous signature replaceAllRegex: '\(\)' with: ''))