*BL-Model-Importer-Java
allUsages
	"All the invocations the localVariable involved"

	| posUsages |
	posUsages := self parentBehaviouralEntity sourceAnchor
		findAllOccurrencesOfVariableNamed: self name.
	^ (((posUsages
		flatCollect: [ :usage | 
			(self parentBehaviouralEntity queryAllOutgoingInvocations
				select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor startPos < usage and: [ out sourceAnchor endPos > usage ] ] ])
		reject: [ :invoc | invoc receiver = self ])
		select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ])
		ifEmpty: [ self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ]