Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> addingPosition [
	^ self privateState
		attributeAt: #addingPosition
		ifAbsent: (self affectedActions ifNil: [ ^ 0] ifNotNil: [:affect | affect sourceAnchor ifNil: [ ^ 0 ] ifNotNil: [ :sourceText | sourceText startPos ] ])
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> computeTitle [
	title := (self source withSuperclassHierarchy flatCollect: #queryAllOutgoingInvocations)
		detect: [ :invoc | invoc signature beginsWith: 'super(' ]
		ifFound: [ :invoc | invoc parameters at: 1 ifAbsent: [ '' ] ]
		ifNone: [ '' ]
]
