Extension { #name : #FamixTParameter }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTParameter >> allAttributeUsages [

	"Gather all attribute usages of this parameter's declared type."

	| usages |
	usages := OrderedCollection new.
	(self declaredType isPrimitiveType or: [ 
		 self incomingAccesses isEmpty ]) ifTrue: [ ^ usages ].

	"We have to bind to class level to follow assignments to attributes and their usages"
	self parentBehaviouralEntity parentType generateFastIfNotDoneAndBind.

	"access -> attribute | assignment | method | argument | return"
	self fastAccesses withIndexDo: [ :fastAccess :index | 
		"attribute: self.x => add to usages"
		(fastAccess atScope: FASTJavaFieldAccess) ifNotEmpty: [ 
			usages add: (self incomingAccesses at: index) ].

		"assignment: x := self => usages of x"
		fastAccess javaVariableAssignementOwner ifNotNil: [ :assignment | 
			Halt now ].

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
FamixTParameter >> allUsages [

	"All the invocations the parameter is involved"

	| posUsages invocations |
	self parentBehaviouralEntity generateFastIfNotDoneAndBind.
	invocations := (self fastAccesses reject: [ :access "not access as invoc receiver" | 
		                (access parentNode isKindOf:
			                 FASTJavaMethodInvocation) and: [ 
			                access parentNode receiver = access ] ])
		               collect: [ :fastAccess | 
			               (fastAccess atScope: FASTJavaMethodInvocation) 
				               ifNotEmpty: [ :invoc | 
				               invoc anyOne famixInvocation ] ]
		               thenReject: #isCollection.
	self parentBehaviouralEntity returnedFamixVariable = self ifTrue: [ 
		invocations addAll:
			(self parentBehaviouralEntity allUsages reject: [ :invoc | 
				 invoc receiver = self ]) ].
	^ invocations
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTParameter >> allUsagesReally [

	"All the invocations the parameter is involved"

	| invocations |
	self parentBehaviouralEntity generateFastIfNotDoneAndBind.
	Halt now.
	invocations := self fastAccesses flatCollect: [ :fastAccess | 
		               fastAccess atScope: FASTJavaMethodInvocation ].
	self parentBehaviouralEntity returnedFamixVariable = self ifTrue: [ 
		invocations addAll:
			(self parentBehaviouralEntity allUsages reject: [ :invoc | 
				 invoc receiver = self ]) ].
	^ invocations
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTParameter >> allUsedAttributes [

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
FamixTParameter >> owningClass [
	^ self parentType 
]
