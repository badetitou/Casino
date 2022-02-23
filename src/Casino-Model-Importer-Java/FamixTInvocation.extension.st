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
	^ self invokedMethod parentType 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> invokedClassName [
	^ self invokedClass invokedClassName
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> invokedMethod [
	^ self candidates anyOneIfOnlyOneElement
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> isGetter [
	^ self signature beginsWith: 'get'.
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> isReturned [

	^ self source declaredType isNotNil and: [ 
		  self source declaredType = self invokedMethod parentType and: [ 
			  ((self source outgoingInvocations asOrderedCollection select: [ 
				    :invoc | invoc sourceAnchor isNotNil ]) sort: [ :a :b | 
				   a sourceAnchor startPos < b sourceAnchor startPos ]) last
			  = self ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTInvocation >> owningClass [
	^ self sender parentType 
]
