Extension { #name : #FAMIXAccess }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAccess >> allUsages [
	^ self variable allUsages
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
