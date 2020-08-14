Extension { #name : #FAMIXMethod }

{ #category : #'*Casino-Helper' }
FAMIXMethod >> methodsOverriding [
	^ self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]

{ #category : #'*Casino-Helper' }
FAMIXMethod >> withMethodsOverriding [
	^ (self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil) add: self; yourself
]
