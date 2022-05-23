Extension { #name : #FamixTLocalVariable }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allUsages [

	"All the invocations the localVariable is involved
	
	It corresponds to
1 - the invocation inside the method 
2 - the invocation in the method this variable is a parameter
	"

	| posUsages invocationsInvolved externalInvocation |
	self parentBehaviouralEntity generateFastIfNotDoneAndBind.
	invocationsInvolved := (self fastAccesses reject: [ :access "not access as invoc receiver" | 
		                        (access parentNode isKindOf:
			                         FASTJavaMethodInvocation) and: [ 
			                        access parentNode receiver = access ] ])
		                       collect: [ :fastAccess | 
			                       (fastAccess atScope:
				                        FASTJavaMethodInvocation) ifNotEmpty: [ 
				                       :invoc | invoc anyOne famixInvocation ] ]
		                       thenReject: [ :el | 
		                       el isCollection or: [ el isNil ] ].
	externalInvocation := invocationsInvolved
		                      reject: [ :involvedInvoc | 
			                      involvedInvoc invokedMethod isStub or: [ 
				                      (involvedInvoc fast arguments includesAny:
					                       self fastAccesses) not ] ]
		                      thenCollect: [ :invoc | 
			                      (invoc invokedMethod parameterAtIndex:
				                       (invoc positionParameterNamed: self name))
				                      allUsages ].
	^ ({ 
		   invocationsInvolved.
		   externalInvocation } flattened reject: #isNil) ifEmpty: [ 
		  self parentBehaviouralEntity allUsages reject: [ :invoc | 
			  invoc receiver = self ] ]
]
