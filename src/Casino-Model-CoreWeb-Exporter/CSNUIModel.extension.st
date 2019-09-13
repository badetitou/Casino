Extension { #name : #CSNUIModel }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIModel >> attributeValue [
	^ super attributeValue , self widget mooseID asString
]
