Extension { #name : #BLUIWidth }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIWidth >> attributeValue [
	^ 'width: ', self text, ';'
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIWidth >> name [
	^ 'style'
]
