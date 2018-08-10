Extension { #name : #FASTJavaVariableDeclarator }

{ #category : #'*BL-Fast-FIX' }
FASTJavaVariableDeclarator >> name [
	^ 'declare: ' , variable asString
]
