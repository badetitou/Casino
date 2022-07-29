Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> allAttributeUsages [

	"Gather all attribute usages of this method's declared type."

	| usages |
	(self declaredType isNil or: [ self declaredType isPrimitiveType ]) 
		ifTrue: [ ^ OrderedCollection new ].

	"invocation -> affectation | argument | return"
	usages := self incomingInvocations flatCollect: #allAttributeUsages.

	"access -> assignment | argument"
	"TODO handle method assignment or passed as argument, e.g. { func := type.func; func() }"
	"self accesses do: [ :access | Halt now ]."

	^ usages
]

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
FamixTMethod >> allUsagesReally [

	^ self incomingInvocations
	  , (self incomingInvocations flatCollect: [ :invoc | 
			   (invoc affectation isNil or: [ 
				    invoc affectation isNotFound or: [ 
					    (self accesses collect: #variable as: Set) includes:
						    invoc affectation ] ])
				   ifTrue: [ {  } ]
				   ifFalse: [ invoc affectation allUsagesReally ] ]) ifEmpty: [ 
		  Halt now.
		  self parentType allUsagesReally ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> allUsedAttributes [

	"Missing case: outgoing invocations passing self as argument"

	| attributes |
	attributes := Set new.
	Halt now.

	"accesses in this method"
	self accesses do: [ :access | 
		| attribute |
		attribute := access variable.
		(attribute isImplicitVariable not and: [ 
			 Halt now.
			 self parentType attributes includes: attribute ]) ifTrue: [ 
			attributes add: attribute ] ].

	"accesses through another self method"
	self outgoingInvocations do: [ :invoc | 
		(invoc receiver isNotNil and: [ invoc receiver isImplicitVariable ])
			ifTrue: [ 
				invoc candidates do: [ :method | 
					attributes addAll: method allUsedAttributes ] ]
			ifFalse: [ "TODO outgoing invoc passing self" ] ].

	^ attributes
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> allUsedAttributesFromParam: aParam [

	"TODO follow uses of param recursively and return used attributes"
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
