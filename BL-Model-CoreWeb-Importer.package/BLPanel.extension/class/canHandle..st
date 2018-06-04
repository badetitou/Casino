*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ '.*Panel' asRegex matchesPrefix: anInvocation invokedClassName