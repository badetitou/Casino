Extension { #name : #CSNUIHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIHorizontalLayout classSide >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includes: anInvocation invokedClassName
]
