*BL-Model-Importer-Java
allUsages
	| posUsages |
	posUsages := self from  sourceAnchor
		findAllOccurrencesOfString: self variable name
		startingAt: 0.
	^ posUsages
		flatCollect: [ :usage | 
			((self from queryAll: #out) select: [:el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ]