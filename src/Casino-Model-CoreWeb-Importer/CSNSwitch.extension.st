Extension { #name : #CSNSwitch }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNSwitch class >> canHandle: anInvocation [
	^ 'BLToggleButton' = anInvocation invokedClassName
]
