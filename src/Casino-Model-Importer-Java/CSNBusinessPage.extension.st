Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> addingPosition [
	^ self privateState
		attributeAt: #addingPosition
		ifAbsent: (self affectedActions ifNil: [ ^ 0] ifNotNil: [:affect | affect sourceAnchor ifNil: [ ^ 0 ] ifNotNil: [ :sourceText | sourceText startPos ] ])
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> computeTitle [
	title := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'super(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]
]
