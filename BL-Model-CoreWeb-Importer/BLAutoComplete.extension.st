Extension { #name : #BLAutoComplete }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLAutoComplete class >> canHandle: anInvocation [
	^ ('BLDefaultQuickSearch|QuicksearchExempleREL' substrings: '|') includes: anInvocation invokedClassName
]
