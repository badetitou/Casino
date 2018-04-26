*BL-Model-Importer-Java
computeTitle
	title := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'super(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]