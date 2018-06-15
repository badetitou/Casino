Extension { #name : #BLModel }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLModel >> attributeValue [
	^ super attributeValue , self attributeOwner mooseID asString
]
