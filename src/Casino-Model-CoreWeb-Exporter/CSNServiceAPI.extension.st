Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNServiceAPI >> dependencies [

	"I return the CSNBuBusinessType used by this service API"

	| dependencies |
	dependencies := Set new.
	self dataType ifNotNil: [ :dataType | 
		dependencies addAll: dataType innerTypeDependencies flattened ].
	self parameters do: [ :parameter | 
		dependencies addAll: parameter dependencies ].
	^ dependencies select: #isBusinessType
]
