*BL-Model-Importer-Java
allUsages
	| posUsages |
	posUsages := self parentBehaviouralEntity sourceAnchor
		findAllOccurrencesOfString: self name
		startingAt: 0.
	posUsages
		flatCollect: [ :usage | 
			(self parentBehaviouralEntity queryAll: #out)
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ].
	self halt