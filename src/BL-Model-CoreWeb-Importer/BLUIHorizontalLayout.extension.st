Extension { #name : #BLUIHorizontalLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHorizontalLayout class >> canHandle: anInvocation [
	^ anInvocation invokedClassName includes: 'HorizontalPanel'
]
