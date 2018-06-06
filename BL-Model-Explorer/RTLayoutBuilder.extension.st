Extension { #name : #RTLayoutBuilder }

{ #category : #'*BL-Model-Explorer' }
RTLayoutBuilder >> sugiyamaSameLevelLoop [
	actionOnEdges add: [ :edge | edge shape withVerticallAttachPoint ].
	layout := RTSugiyamaLayoutSameLevelLoop new.
	^ layout
]
