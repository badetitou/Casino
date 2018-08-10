Extension { #name : #BLSlider }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLSlider class >> canHandle: anInvocation [
	^ 'BLSliderBar' = anInvocation invokedClassName
]
