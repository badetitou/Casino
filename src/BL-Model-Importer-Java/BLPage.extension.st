Extension { #name : #BLPage }

{ #category : #'*BL-Model-Importer-Java' }
BLPage >> computeSubtitle [
	subtitle := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'setPhaseSubtitle(*' match: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLPage >> computeTitle [
	title := (((self source withSuperclassHierarchy flatCollect: #outgoingInvocations)
		select: [ :invoc | 'setPhaseTitle\(.*|super\(.*' asRegex matches: invoc signature ]) at: 1 ifAbsent: [ ^ '' ]) parameters at: 1 ifAbsent: [ '' ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLPage >> postImport [
	^ businessPage := self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]
