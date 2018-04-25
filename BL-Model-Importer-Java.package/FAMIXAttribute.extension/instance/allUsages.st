*BL-Model-Importer-Java
allUsages
	| posUsages |
	posUsages := (self parentType methods select: [ :method | method hasSourceAnchor and: [method isInstanciationInitializer not ] ] ) flatCollect: [ :method | method sourceAnchor
		findAllOccurrencesOfVariableNamed: self name
		].
	^ (posUsages
		flatCollect: [ :usage | 
			((self parentType queryAllOutgoingInvocations) select: [:el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ]) reject: [ :invoc | invoc receiver = self ] 