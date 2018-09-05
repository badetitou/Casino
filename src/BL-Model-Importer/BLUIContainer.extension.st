Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Importer' }
BLUIContainer >> addWidget: aWidget [
	widgets add: aWidget
]

{ #category : #'*BL-Model-Importer' }
BLUIContainer class >> canHandle: anInvocation [
	^ false
]
