*BL-Model-Importer-Java
extractParameters
	^ ((self
		copyFrom: (self findString: '(') + 1
		to: (self findLastOccurrenceOfString: ')' startingAt: 0) - 1)
		findTokens: ','
		escapedBy: '"') collect: [ :string | string trim ]