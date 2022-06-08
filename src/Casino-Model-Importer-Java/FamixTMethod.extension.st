Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> allUsages [

	^ self incomingInvocations
	  , (self incomingInvocations flatCollect: [ :invoc | 
			   (invoc affectation isNil or: [ 
				    invoc affectation isNotFound or: [ 
					    (self accesses collect: #variable as: Set) includes:
						    invoc affectation ] ])
				   ifTrue: [ {  } ]
				   ifFalse: [ invoc affectation allUsages ] ]) ifEmpty: [ 
		  self parentType allUsages ]
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

	^ self sortedParameters at: anIndex
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> returnedFamixInvocation [

	self generateFastIfNotDoneAndBind.
	^ (self fast
		   allToScope: FASTJavaReturnStatement
		   until: [ :node | node isKindOf: FASTJavaNewClassExpression ])
		  asOrderedCollection
		  ifNotEmpty: [ :returnStatements | 
			  returnStatements
				  detect: [ :statement | statement expression isNotNil ]
				  ifOne: [ :statement | statement expression famixInvocation ]
				  ifNone: [ nil ] ]
		  ifEmpty: [ nil ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> returnedFamixVariable [

	self generateFastIfNotDoneAndBind.
	^ (self fast
		   allToScope: FASTJavaReturnStatement
		   until: [ :node | node isKindOf: FASTJavaNewClassExpression ])
		  asOrderedCollection
		  ifNotEmpty: [ :returnStatements | 
			  returnStatements
				  detect: [ :statement | statement expression isNotNil ]
				  ifOne: [ :statement | statement expression famixVariable ]
				  ifNone: [ nil ] ]
		  ifEmpty: [ nil ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> sortedParameters [

	^ self parameters sorted: [ :param1 :param2 | 
		  param1 sourceAnchor startPos < param2 sourceAnchor startPos ]
]
