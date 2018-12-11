Extension { #name : #BLUIRelativeHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeHeight class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ false ]
]
