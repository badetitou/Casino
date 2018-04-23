*BL-Model-Importer-Java
allUsages
	| posUsages |
	posUsages := (self parentType methods reject: #isInstanciationInitializer) flatCollect: [ :method | method sourceAnchor
		findAllOccurrencesOfString: self name
		startingAt: 0. ].
	^ (posUsages
		flatCollect: [ :usage | 
			((self parentType queryAllOutgoingInvocations) select: [:el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ]) reject: [ :invoc | invoc receiver = self ] 