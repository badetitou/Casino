Extension { #name : #CSNProgressBar }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNProgressBar class >> canHandle: anInvocation [
	^ 'BLProgressBar' = anInvocation invokedClassName
]
