testing
canHandle: anInvocation
	^ 'BLImage|BLImageButton|Image' asRegex matchesPrefix: anInvocation invokedClassName