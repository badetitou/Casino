Extension { #name : #CSNServiceAPIParameter }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNServiceAPIParameter >> dependencies [

	| dependencies |
	dependencies := Set new.
	self dataType ifNotNil: [ :dataType | 
		dependencies addAll: dataType innerTypeDependencies flattened ].
	^ dependencies
]
