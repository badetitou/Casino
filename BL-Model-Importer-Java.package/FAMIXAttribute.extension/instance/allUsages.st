*BL-Model-Importer-Java
allUsages
	| posUsages methods |
	methods := "self parentType methods."	self incomingAccesses select: #isRead thenCollect: #from.
	posUsages := (methods
		select: [ :method | method hasSourceAnchor and: [ method isInstanciationInitializer not ] ])
		flatCollect: [ :method | method sourceAnchor findAllOccurrencesOfVariableNamed: self name ].
	^ ((posUsages
		flatCollect: [ :usage | 
			(self parentType outgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ])
		reject: [ :invoc | invoc receiver = self ])
		select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ]