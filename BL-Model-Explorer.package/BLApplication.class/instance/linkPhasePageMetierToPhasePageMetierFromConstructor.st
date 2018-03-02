accessing
linkPhasePageMetierToPhasePageMetierFromConstructor
	^ {(self modelPhases , self modelPageMetier)} flatten
		flatCollect: [ :el | 
			el outgoingInvocations
				select: [ :invoc | (invoc candidates at: 1) isConstructor and: [ (invoc receiver ifNil: [ false ] ifNotNil: [ :i | i name = #super ]) not ] ]
				thenCollect: [ :invoc | el -> (invoc candidates at: 1) parentType ] ]