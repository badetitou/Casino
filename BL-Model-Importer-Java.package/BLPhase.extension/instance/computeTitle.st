*BL-Model-Importer-Java
computeTitle
	^ (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'setPhaseTitle(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]