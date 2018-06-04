*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ '.*HorizontalPanel' asRegex matchesPrefix: anInvocation invokedClassName