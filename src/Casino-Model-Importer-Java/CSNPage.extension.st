Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> computeSubtitle [
	subtitle := (self source withSuperclassHierarchy flatCollect: #queryAllOutgoingInvocations)
		detect: [ :invoc | invoc signature beginsWith: 'setPhaseSubtitle(' ]
		ifFound: [ :invoc | invoc parameters at: 1 ifAbsent: [ '' ] ]
		ifNone: [ '' ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> computeTitle [
	title := (self source withSuperclassHierarchy flatCollect: #queryAllOutgoingInvocations)
		detect: [ :invoc | invoc signature beginsWithAnyOf: {'setPhaseTitle(' . 'super('} ]
		ifFound: [ :invoc | invoc parameters at: 1 ]
		ifNone: [ '' ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNPage >> postImport [
	^ businessPage := self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]
