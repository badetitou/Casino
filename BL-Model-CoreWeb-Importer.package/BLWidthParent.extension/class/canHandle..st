*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'width' ]