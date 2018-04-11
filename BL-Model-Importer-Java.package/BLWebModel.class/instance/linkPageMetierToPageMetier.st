private
linkPageMetierToPageMetier
	^ self listOfPageMetier 
		flatCollect: [ :pageMetier | 
			(pageMetier outgoingInvocations
				reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
				thenCollect: [ :invoc | invoc candidates at: 1 ])
				select: [ :e | e isConstructor and: [ self listOfPageMetier includes: e parentType ] ]
				thenCollect: [ :e | pageMetier -> e parentType ] ]