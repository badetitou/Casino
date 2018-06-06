Extension { #name : #RTLayoutBuilder }

{ #category : #'*ComponentAnalyser' }
RTLayoutBuilder >> sugiyamaSameLevelLoop [
	actionOnEdges add: [ :edge | edge shape withVerticallAttachPoint ].
	layout := RTSugiyamaLayoutSameLevelLoop new.
	^ layout
]
