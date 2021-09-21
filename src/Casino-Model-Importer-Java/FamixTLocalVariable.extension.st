Extension { #name : #FamixTLocalVariable }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allUsages [

	"All the invocations the localVariable is involved
	
	It corresponds to
1 - the invocation inside the method 
2 - the invocation in the method this variable is a parameter
	"

	| posUsages invocationsInvolved localInvocation externalInvocation |
	posUsages := self parentBehaviouralEntity sourceAnchor findAllOccurrencesOfVariableNamed: self name.
	invocationsInvolved := posUsages flatCollect: [ :usage | 
		                       self parentBehaviouralEntity queryAllOutgoingInvocations select: [ :el | 
			                       el hasSourceAnchor and: [ el sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ].
	localInvocation := invocationsInvolved select: [ :invoc | 
		                   invoc receiver ~= self and: [ invoc parameters anySatisfy: [ :param | param beginsWith: self name ] ] ].
	externalInvocation := localInvocation collect: [ :invoc | (invoc invokedMethod parameterAtIndex: (invoc positionParameterNamed: self name)) allUsages ].
	^ { 
		  localInvocation.
		  externalInvocation } flattened ifEmpty: [ self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ]
]
