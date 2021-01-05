Extension { #name : #FamixTInvocation }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> allContainers [
	^ self container
		ifNotNil: [ :container | 
			{self container.
			container allContainers} flattened ]
		ifNil: [ {} ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> container [
	self sourceAnchor ifNil: [ ^ nil ].
	^ ((self source outgoingInvocations iterator
		| [ :invocation | invocation sourceAnchor isNotNil ] selectIt
		| [ :invocation | invocation = self ] rejectIt
		| [ :invocation | self sourceAnchor startPos > invocation sourceAnchor startPos ] selectIt
		| [ :invocation | self sourceAnchor endPos < invocation sourceAnchor endPos ] selectIt
		> OrderedCollection)
		sort: [ :invocationA :invocationB | invocationA sourceAnchor startPos > invocationB sourceAnchor startPos ]) at: 1 ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> invokedClass [
	^ (self candidates at: 1) parentType 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> invokedClassName [
	^ self invokedClass invokedClassName
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> isGetter [
	^ self signature prefixMatchesRegex: 'get'.
]
