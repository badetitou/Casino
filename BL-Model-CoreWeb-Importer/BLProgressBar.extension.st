Extension { #name : #BLProgressBar }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLProgressBar class >> canHandle: anInvocation [
	^ 'BLProgressBar' = anInvocation invokedClassName
]
