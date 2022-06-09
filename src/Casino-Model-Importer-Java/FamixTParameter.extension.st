Extension { #name : #FamixTParameter }

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
FamixTParameter >> owningClass [
	^ self parentType 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTParameter >> parameterIndex [
	^ self parentBehaviouralEntity sortedParameters indexOf: self
]
