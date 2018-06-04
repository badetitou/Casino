*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ '.*Chart.*' asRegex matchesPrefix: anInvocation invokedClassName