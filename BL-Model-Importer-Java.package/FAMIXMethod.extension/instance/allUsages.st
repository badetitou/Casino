*BL-Model-Importer-Java
allUsages
	^ self incomingInvocations ifEmpty: [ self parentType allUsages ].