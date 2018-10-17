Extension { #name : #BLUIHeight }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIHeight >> attributeValue [
	^ 'height: ', self text, ';'
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIHeight >> name [
	^ 'style'
]
