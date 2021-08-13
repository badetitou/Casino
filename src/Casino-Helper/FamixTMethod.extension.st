Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Helper' }
FamixTMethod >> isInitializer [
	^ self mooseModel isSmalltalk
		ifTrue: [ (('*initialize*' match: self category) or: [ '*initialize*' match: self name ]) or: [ self isConstructor ] ]
		ifFalse: [ self isConstructor ]
]

{ #category : #'*Casino-Helper' }
FamixTMethod >> methodsOverriding [
	^ self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenReject: [ :each | each isNil or: [ each = self ] ]
]

{ #category : #'*Casino-Helper' }
FamixTMethod >> withMethodsOverriding [
	^ (self belongsTo subclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil) add: self; yourself
]
