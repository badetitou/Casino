Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGridLayout class >> canHandle: anInvocation [
	^ anInvocation invokedClassName includes: 'HorizontalPanel' 
]
