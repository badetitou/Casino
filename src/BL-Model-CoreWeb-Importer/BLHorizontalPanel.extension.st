Extension { #name : #BLHorizontalPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLHorizontalPanel class >> canHandle: anInvocation [
	^ '.*HorizontalPanel' asRegex matchesPrefix: anInvocation invokedClassName
]
