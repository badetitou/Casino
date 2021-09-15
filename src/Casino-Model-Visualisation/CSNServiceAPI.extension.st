Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Visualisation' }
CSNServiceAPI >> allUsedType [
	^ { self dataType toBussinessType . self parameters collect: #allUsedType } flattened asSet
]
