Extension { #name : #FAMIXMethod }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXMethod >> allUsages [
	^ self incomingInvocations
		,
			(self incomingInvocations
				flatCollect: [ :invoc | 
					invoc affectation
						ifNil: [ {} ]
						ifNotNil: [ :aff | aff allUsages ] ]) ifEmpty: [ self parentType allUsages ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXMethod >> findAttributeNamed: anAttributeName [
	"an Attribute name can from local variable, class variable, or a parameter variable"
	(self localVariables select: [ :localVariable | localVariable name = anAttributeName ]) ifNotEmpty: [ :results | ^ results at: 1 ].
	(self parentType findAttributeNamed: anAttributeName) ifNotNil: [ :result | ^ result ].
	^ nil 

	
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXMethod >> isInstanciationInitializer [
	^ '<Initializer>' match: self name
]
