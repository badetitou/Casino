Extension { #name : #CSNModel }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModel >> attributeValue [
	^ super attributeValue , self widget mooseID asString
]
