Extension { #name : #FAMIXMethod }

{ #category : #'*Casino-Helper' }
FAMIXMethod >> methodsOverriding [
	^ self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]
