Extension { #name : #FAMIXAccess }

{ #category : #'*BL-Model-Importer-Java' }
FAMIXAccess >> allUsages [
	| posUsages |
	posUsages := self from sourceAnchor findAllOccurrencesOfVariableNamed: self variable name.
	^ (posUsages
		flatCollect: [ :usage | 
			(self from queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage  ] ])
		reject: [ :invoc | invoc receiver = self variable ]
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXAccess >> isReturned [
	^ self from declaredType isNotNil and: [self from declaredType isPrimitiveType not and: [(self from accesses asOrderedCollection sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) last = self]]
]
