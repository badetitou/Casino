Extension { #name : #CSNUIVerticalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIVerticalLayout classSide >> canHandle: anInvocation [
	^ #('VerticalPanel' 'BLVerticalPanel') includes: anInvocation invokedClassName
]
