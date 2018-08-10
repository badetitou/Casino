Extension { #name : #BLSwitch }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLSwitch class >> canHandle: anInvocation [
	^ 'BLToggleButton' = anInvocation invokedClassName
]
