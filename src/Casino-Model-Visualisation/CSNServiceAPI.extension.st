Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Visualisation' }
CSNServiceAPI >> allUsedType [

	^ { 
		  (#returnType -> self dataType toBussinessType).
		  (#parameters -> (self parameters collect: #allUsedType) flattened) } asDictionary
]
