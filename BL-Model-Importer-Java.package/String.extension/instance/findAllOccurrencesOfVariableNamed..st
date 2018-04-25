*BL-Model-Importer-Java
findAllOccurrencesOfVariableNamed: substring 
	^ (('([^\w]?)',substring,'[^\w]') asRegex matchingRangesIn: self) collect: [:a | a first ].