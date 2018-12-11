Extension { #name : #BLUIAbsoluteHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteHeight class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ false ].
]
