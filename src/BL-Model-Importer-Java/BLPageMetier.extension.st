Extension { #name : #BLPageMetier }

{ #category : #'*BL-Model-Importer-Java' }
BLPageMetier >> addingPosition [
	^ self privateState
		attributeAt: #addingPosition
		ifAbsent: (self affectedActions sourceAnchor ifNil: [ 0 ] ifNotNil: [ :sourceText | sourceText startPos ])
]

{ #category : #'*BL-Model-Importer-Java' }
BLPageMetier >> computeTitle [
	title := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'super(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]
]
