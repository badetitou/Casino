private
searchCalledPhase: aSignature
	^ (self getPhaseNamed: (aSignature replaceAllRegex: '\(\)' with: '')) ifNil: [^nil]