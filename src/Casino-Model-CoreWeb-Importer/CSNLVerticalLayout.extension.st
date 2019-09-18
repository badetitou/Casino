Extension { #name : #CSNLVerticalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLVerticalLayout classSide >> canHandle: anInvocation [
	^ #('VerticalPanel' 'BLVerticalPanel') includes: anInvocation invokedClassName
]
