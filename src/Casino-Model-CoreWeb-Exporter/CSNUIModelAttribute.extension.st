Extension { #name : #CSNUIModelAttribute }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIModelAttribute >> attributeValue [
	^ super attributeValue , self widget mooseID asString
]
