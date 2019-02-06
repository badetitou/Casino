Extension { #name : #CSNAutoComplete }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNAutoComplete class >> canHandle: anInvocation [
	^ #('BLDefaultQuickSearch' 'QuicksearchExempleREL') includes: anInvocation invokedClassName
]
