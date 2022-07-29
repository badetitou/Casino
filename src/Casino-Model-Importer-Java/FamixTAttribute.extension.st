Extension { #name : #FamixTAttribute }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTAttribute >> allAttributeUsages [

	| usages |
	usages := OrderedCollection new.
	self declaredType isPrimitiveType ifTrue: [ ^ usages ].

	Halt now.

	^ usages
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTAttribute >> allUsages [
	"check the usage of the variable in the method it is invoked"

	| methodsToUsages methods invocations return |
	"check if the variable is returned by a method"
	return := (self incomingAccesses select: #isReturned) ifEmpty: [ {} ] ifNotEmpty: [ :list | list first source allUsages ].

	"check the invocation inside methods"
	methods := self incomingAccesses collect: #source as: Set.	"self parentType methods."
	methodsToUsages := methods
		select: [ :method | method hasSourceAnchor and: [ method isInstanciationInitializer not ] ]
		thenCollect: [ :method | method -> (method sourceAnchor findAllOccurrencesOfVariableNamed: self name) ].
	invocations := (methodsToUsages
		collect: [ :methodToUsage | 
			methodToUsage value
				collect: [ :usage | 
					(methodToUsage key parentType queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
						select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ]) flattened reject: [ :invoc | invoc receiver = self ].
	^ {(invocations select: [ :usage | usage parameters anySatisfy: [ :param | param includesSubstring: self name ] ]).
	return} flattened
]
