Extension { #name : #BLUIInputRange }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIInputRange class >> canHandle: anInvocation [
	^ 'BLSliderBar' = anInvocation invokedClassName
]
