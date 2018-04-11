as yet unclassified
generatePhasefrom: aBlApplication
	aBlApplication phases do: [ :aPhase | self listOfPhases add: (self createPhaseInModel: aPhase) ]