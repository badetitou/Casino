Extension { #name : #Collection }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
Collection >> angularString [
	^ (self flattened reject: #isNil) flatCollect: #angularString
]
