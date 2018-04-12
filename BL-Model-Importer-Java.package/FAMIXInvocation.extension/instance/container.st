*BL-Model-Importer-Java
container
	^ ((self from outgoingInvocations
		select: [ :invocation | 
			self sourceAnchor startPos > invocation sourceAnchor startPos
				and: [ self sourceAnchor endPos < invocation sourceAnchor endPos ] ])
		sort:
			[ :invocationA :invocationB | invocationA sourceAnchor startPos > invocationB sourceAnchor startPos ]) at: 1 ifAbsent: [ ^ nil ]