Extension { #name : #FAMIXAccess }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> allUsages [
	^ self variable allUsages
		ifEmpty: [ | posUsages |
			posUsages := ((self from allAtAnyScope: {FamixTClass. FamixTMethod}) select: #hasSourceAnchor) first sourceAnchor
				findAllOccurrencesOfVariableNamed: self variable name.
			(posUsages
				flatCollect: [ :usage | 
					(self from queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
						select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage ] ])
				reject: [ :invoc | invoc receiver = self variable ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> endAffectationPos [
	^ ((self from allAtScope: FamixTClass) select: #hasSourceAnchor) first sourceAnchor completeText findNext: $; for: self sourceAnchor startPos
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> isReturned [
	^ self from declaredType isNotNil and: [self from declaredType isPrimitiveType not and: [((self from accesses asOrderedCollection select: [:access | access sourceAnchor isNotNil]) sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) last = self]]
]
