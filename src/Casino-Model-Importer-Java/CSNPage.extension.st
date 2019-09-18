Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> computeSubtitle [
	subtitle := (((self
		source
		withSuperclassHierarchy
		flatCollect:
			#outgoingInvocations)
		select:
			[ :invoc | 
			invoc
						signature beginsWith: 
			'setPhaseSubtitle('
					 ])
		at: 1
		ifAbsent:
			[ ^ '' ])
		parameters
		at: 1
		ifAbsent:
			[ '' ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> computeTitle [
	title := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'setPhaseTitle\(.*|super\(.*' asRegex matches: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> postImport [
	^ businessPage := self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]
