private
searchCalledPhaseFromInvocation: invoc
	^ self searchCalledPhase:  (invoc to at: 1) signature