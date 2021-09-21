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
FamixTMethod >> findAttributeNamed: anAttributeName [
	"an Attribute name can from local variable, class variable, or a parameter variable"
	(self localVariables select: [ :localVariable | localVariable name = anAttributeName ]) ifNotEmpty: [ :results | ^ results at: 1 ].
	(self parentType findAttributeNamed: anAttributeName) ifNotNil: [ :result | ^ result ].
	^ nil 

	
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> isInstanciationInitializer [
	^ '<Initializer>' match: self name
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> parameterAtIndex: anIndex [
	^ (self parameters sorted: [ :param1 :param2 | param1 sourceAnchor startPos < param2 sourceAnchor startPos ]) at: anIndex
]
