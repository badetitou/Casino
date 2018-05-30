private
linkPageMetierToPageMetier
	^ ((self listOfPageMetier collect: #source), xmlUiLink keys 
		flatCollect: [ :pageMetier | 
			(pageMetier outgoingInvocations
				reject: [ :invoc | 	invoc  signature matchesRegex: '.*this\(.*|.*super\(.*'   ]
				thenCollect: [ :invoc |  invoc candidates at: 1 ])
				select: [ :e | (e isConstructor and: [ self modelPageMetier includes: e parentType ]) ]
				thenCollect: [ :e | (self getPageMetierFromClass: (pageMetier)) -> (self getPageMetierFromClass: (e parentType)) ] ] )select: [ :assoc | assoc key isNotNil ]