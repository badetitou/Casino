Extension { #name : #BLTable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLTable class >> canHandle: anInvocation [
	^ 'BLTableList' = anInvocation invokedClassName
]
