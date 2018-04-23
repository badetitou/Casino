*BL-Model-Importer-Java
findAllOccurrencesOfString: aString startingAt: anIndexPosition
	^ (self sourceText findAllOccurrencesOfString: aString startingAt: 0)
		collect: [ :pos | pos + self startPos ]