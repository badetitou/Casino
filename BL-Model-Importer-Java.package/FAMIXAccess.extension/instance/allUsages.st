*BL-Model-Importer-Java
allUsages
	| posUsages |
	posUsages := self from sourceAnchor findAllOccurrencesOfVariableNamed: self variable name.
	^ (posUsages
		flatCollect: [ :usage | 
			(self from queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage  ] ])
		reject: [ :invoc | invoc receiver = self variable ]