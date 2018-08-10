Extension { #name : #BLPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLPanel class >> canHandle: anInvocation [
	^ '.*Panel' asRegex matchesPrefix: anInvocation invokedClassName
]
