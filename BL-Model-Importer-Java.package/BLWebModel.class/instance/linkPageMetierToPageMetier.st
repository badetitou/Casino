private
linkPageMetierToPageMetier
	^ self listOfPageMetier 
		flatCollect: [ :pageMetier | 
			(pageMetier source outgoingInvocations
				reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
				thenCollect: [ :invoc |  invoc candidates at: 1 ])
				select: [ :e | e isConstructor and: [ self modelPageMetier includes: e parentType ] ]
				thenCollect: [ :e | pageMetier -> (self getPageMetierFromClass: (e parentType)) ] ]