*ComponentAnalyser
sugiyamaSameLevelLoop
	actionOnEdges add: [ :edge | edge shape withVerticallAttachPoint ].
	layout := RTSugiyamaLayoutSameLevelLoop new.
	^ layout