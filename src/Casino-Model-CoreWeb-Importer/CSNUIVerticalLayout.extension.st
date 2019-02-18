Extension { #name : #CSNUIVerticalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIVerticalLayout class >> canHandle: anInvocation [
	^ #('VerticalPanel' 'BLVerticalPanel') includes: anInvocation invokedClassName
]
