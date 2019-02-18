Extension { #name : #CSNUITable }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUITable class >> canHandle: anInvocation [
	^ #('BLTableList') includes: anInvocation invokedClassName
]
