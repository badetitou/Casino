definition
newBuilder
	^ FmxNGGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself