Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> allUsages [
	^ self incomingInvocations
		,
			(self incomingInvocations
				flatCollect: [ :invoc | 
					invoc affectation
						ifNil: [ {} ]
						ifNotNil: [ :aff | aff allUsages ] ]) ifEmpty: [ self parentType allUsages ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> isInstanciationInitializer [
	^ '<Initializer>' match: self name
]
