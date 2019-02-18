Extension { #name : #CSNChart }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNChart class >> canHandle: anInvocation [
	^ '.*Chart.*' asRegex matchesPrefix: anInvocation invokedClassName
]
