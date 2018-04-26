*BL-Model-Importer-Java
computeSubtitle
	subtitle := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'setPhaseSubtitle(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]