Extension { #name : #CSNUIInputRange }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIInputRange class >> canHandle: anInvocation [
	^ 'BLSliderBar' = anInvocation invokedClassName
]
