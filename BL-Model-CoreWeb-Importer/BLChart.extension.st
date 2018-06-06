Extension { #name : #BLChart }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLChart class >> canHandle: anInvocation [
	^ '.*Chart.*' asRegex matchesPrefix: anInvocation invokedClassName
]
