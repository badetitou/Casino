as yet unclassified
computeTSFileNameFromFAMIXCLass: aFAMIXClass
	"./Source/BLCoreIncubatorGwt/src/fr/bl/client/kitchensink/PhaseHomeKitchenSink.java
	-> 
	fr/bl/client/kitchensink/PhaseHomeKitchenSink.ts"
	
	^ (aFAMIXClass sourceAnchor fileName replaceAllRegex: '.java' with: '.ts') copyWithRegex: '.*/src/' matchesReplacedWith: ''