*BL-Model-Importer-Java
parameters
	^ (signature copyFrom: (signature findString: '(') + 1 to: (signature findLastOccurrenceOfString: ')' startingAt: 0) - 1) findTokens: ',' escapedBy: '"'