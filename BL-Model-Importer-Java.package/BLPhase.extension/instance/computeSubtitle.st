*BL-Model-Importer-Java
computeSubtitle
	^ (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations) select: [ :invoc | 'setPhaseSubtitle(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ])
		parameters at: 1 ifAbsent: [ '' ]