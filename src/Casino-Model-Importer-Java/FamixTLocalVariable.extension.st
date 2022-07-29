Extension { #name : #FamixTLocalVariable }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allAttributeUsages [

	"Gather all attribute usages of this variable's declared type."

	"TODO new version of this method to call with an invocation and gathering only when using its assignment, e.g. with `atScope: FASTJavaAssignementExpression`
	example with invocation from `func`:
	```java
	class Model { int foo; int bar; }
	
	class Client {
		int baz() {
			Model self = new Model();   self.foo; // ignore
			self = WebService.func();   self.bar; // include
			self = new Model();  return self.foo; // ignore
		}
	}```"

	| usages |
	usages := OrderedCollection new.
	self declaredType isPrimitiveType ifTrue: [ ^ usages ].
	self parentBehaviouralEntity parentType generateFastIfNotDoneAndBind.

	"access -> attribute | method | argument | return"
	self fastAccesses withIndexDo: [ :fastAccess :index | 
		"attribute: self.x => add to usages"
		(fastAccess atScope: FASTJavaFieldAccess) ifNotEmpty: [ 
			Halt now. "FIXME: can't trust index, use another way"
			usages add: (self accesses at: index) ].

		"method: self.func() => usages in func"
		fastAccess receiverOwner ifNotNil: [ :fastInvoc | 
			usages addAll: fastInvoc famixInvocation allAttributeUsages ].

		"argument: func(x: self) => usages of x parameter"
		fastAccess argumentOwner ifNotNil: [ :fastInvoc | 
			usages addAll:
				(fastInvoc famixInvocation invokedMethod parameterAtIndex:
					 (fastInvoc famixInvocation positionParameterNamed: self name))
					allAttributeUsages ].

		"return: func { return self } => usages of func"
		(fastAccess atScope: FASTJavaReturnStatement) ifNotEmpty: [ 
			usages addAll: self parentBehaviouralEntity allAttributeUsages ] ].

	^ usages
]

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

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allUsagesReally [

	"All the invocations the localVariable is involved
	
	It corresponds to
1 - the invocation inside the method 
2 - the invocation in the method this variable is a parameter
	"

	| invocationsInvolved externalInvocation |
	self parentBehaviouralEntity generateFastIfNotDoneAndBind.
	invocationsInvolved := self fastAccesses flatCollect: [ :fastAccess | 
		                       Halt if:
			                       (fastAccess atScope:
				                        FASTJavaMethodInvocation) size > 1.
		                       (fastAccess atScope: FASTJavaMethodInvocation) 
			                       collect: #famixInvocation ].
	externalInvocation := invocationsInvolved
		                      reject: [ :involvedInvoc | 
			                      involvedInvoc invokedMethod isStub or: [ 
				                      (involvedInvoc fast arguments includesAny:
					                       self fastAccesses) not ] ]
		                      thenCollect: [ :invoc | 
			                      (invoc invokedMethod parameterAtIndex:
				                       (invoc positionParameterNamed: self name))
				                      allUsagesReally ].
	^ ({ 
		   invocationsInvolved.
		   externalInvocation } flattened reject: #isNil) ifEmpty: [ 
		  self parentBehaviouralEntity allUsagesReally reject: [ :invoc | 
			  invoc receiver = self ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allUsedAttributes [

	"All the invocations the localVariable is involved
	
	It corresponds to
1 - the invocation inside the method 
2 - the invocation in the method this variable is a parameter
	"

	| invocationsInvolved externalInvocation |
	self parentBehaviouralEntity generateFastIfNotDoneAndBind.
	invocationsInvolved := self fastAccesses flatCollect: [ :fastAccess | 
		                       Halt if:
			                       (fastAccess atScope:
				                        FASTJavaMethodInvocation) size > 1.
		                       (fastAccess atScope: FASTJavaMethodInvocation) 
			                       collect: #famixInvocation ].
	externalInvocation := invocationsInvolved
		                      reject: [ :involvedInvoc | 
			                      involvedInvoc invokedMethod isStub or: [ 
				                      (involvedInvoc fast arguments includesAny:
					                       self fastAccesses) not ] ]
		                      thenCollect: [ :invoc | 
			                      (invoc invokedMethod parameterAtIndex:
				                       (invoc positionParameterNamed: self name))
				                      allUsedAttributes ].
	^ ({ 
		   invocationsInvolved.
		   externalInvocation } flattened reject: #isNil) ifEmpty: [ 
		  self parentBehaviouralEntity allUsedAttributes reject: [ :invoc | 
			  invoc receiver = self ] ]
]
