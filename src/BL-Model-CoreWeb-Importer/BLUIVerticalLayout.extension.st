Extension { #name : #BLUIVerticalLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIVerticalLayout class >> canHandle: anInvocation [
	^ anInvocation invokedClassName includes: 'VerticalPanel'
]
