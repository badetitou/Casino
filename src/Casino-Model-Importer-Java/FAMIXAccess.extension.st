Extension { #name : #FAMIXAccess }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> allUsages [
	^ self variable allUsages
		ifEmpty: [ | posUsages |
			posUsages := (((self source allAtAnyScope: {FamixTClass . FamixTMethod}) select: #hasSourceAnchor) reject: [ :el | el isClass and: [ el isInnerClass ]]) anyOneIfOnlyOneElement sourceAnchor
				findAllOccurrencesOfVariableNamed: self variable name.
			(posUsages
				flatCollect:
					[ :usage | (self source queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ]) select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage ] ])
				reject: [ :invoc | invoc receiver = self variable ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> endAffectationPos [
	^ ((self source allAtScope: FamixTClass)
		select: [ :class | class isNotNil and: [ class hasSourceAnchor and: [ class isInnerClass not ] ] ])
		anyOneIfOnlyOneElement sourceAnchor completeText
		findNext: $;
		for: self sourceAnchor startPos
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> isReturned [
	^ self source declaredType isNotNil
		and: [ self source declaredType isPrimitiveType not
				and: [ ((self source accesses asOrderedCollection select: [ :access | access sourceAnchor isNotNil ])
						sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) last = self ] ]
]
