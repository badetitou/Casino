*BL-Model-Importer-Java
allUsages
	"All the invocations the localVariable involved"
	| posUsages |
	posUsages := self parentBehaviouralEntity sourceAnchor
		findAllOccurrencesOfString: self name
		startingAt: 0.
	^ posUsages
		flatCollect: [ :usage | 
			((self parentBehaviouralEntity queryAll: #out) select: [:el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ]