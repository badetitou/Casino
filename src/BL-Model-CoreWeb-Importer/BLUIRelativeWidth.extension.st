Extension { #name : #BLUIRelativeWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeWidth class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ false ]
]
