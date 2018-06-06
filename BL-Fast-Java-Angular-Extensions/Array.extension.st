Extension { #name : #Array }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
Array >> angularString [
	^ (self flattened reject: #isNil) flatCollect: #angularString
]
