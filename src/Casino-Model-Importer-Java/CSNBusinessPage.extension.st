Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> addingPosition [

	^ self
		  attributeAt: #addingPosition
		  ifAbsent:
			  ((self affectedActions isNil or: [ 
				    self affectedActions isNotFound ])
				   ifTrue: [ ^ 0 ]
				   ifFalse: [ 
					   self affectedActions sourceAnchor
						   ifNil: [ ^ 0 ]
						   ifNotNil: [ :sourceText | sourceText startPos ] ])
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNBusinessPage >> computeTitle [
	title := (self source withSuperclassHierarchy flatCollect: #queryAllOutgoingInvocations)
		detect: [ :invoc | (invoc signature beginsWith: 'super(') and: [ invoc parameters isNotEmpty ] ]
		ifFound: [ :invoc | invoc parameters at: 1 ifAbsent: [ '' ] ]
		ifNone: [ '' ]
]
