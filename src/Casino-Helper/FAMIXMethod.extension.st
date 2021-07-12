Extension { #name : #FAMIXMethod }

{ #category : #'*Casino-Helper' }
FAMIXMethod >> methodsOverriding [
	^ self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenReject: [ :each | each isNil or: [ each = self ] ]
]

{ #category : #'*Casino-Helper' }
FAMIXMethod >> withMethodsOverriding [
	^ (self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil) add: self; yourself
]
