private
searchCalledPhase: aSignature
	^ self
		getPhaseClassFrom:
			((self
				getPhaseNamed: (aSignature replaceAllRegex: '\(\)' with: '')) ifNil: [^nil])