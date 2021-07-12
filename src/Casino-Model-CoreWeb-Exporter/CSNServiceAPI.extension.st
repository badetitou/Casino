Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNServiceAPI >> dependencies [
	^ (((self parameters collect: #dataType) , {self dataType}) asSet reject: #isNil 
		thenCollect: [ :dataType | 
			dataType isBusinessType
				ifTrue: [ dataType ]
				ifFalse: [ dataType isComplexType
						ifTrue: [ dataType isCollectionType
								ifTrue: [ dataType type ]
								ifFalse: [ {dataType key . dataType value} ] ]
						ifFalse: [ {} ] ] ]) flattened select: #isBusinessType
]
