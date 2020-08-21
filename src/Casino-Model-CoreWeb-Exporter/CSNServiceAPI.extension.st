Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNServiceAPI >> dependencies [
	^ (self dataType isBusinessType
		ifTrue: [ {self dataType} ]
		ifFalse: [ self dataType isComplexType
				ifTrue: [ self dataType isCollectionType
						ifTrue: [ {self dataType type} ]
						ifFalse: [ {self dataType key . self dataType value} ] ]
				ifFalse: [ {} ] ]) select: #isBusinessType
]
