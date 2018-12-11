Extension { #name : #BLUIAbsoluteWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteWidth class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ false ]
]
