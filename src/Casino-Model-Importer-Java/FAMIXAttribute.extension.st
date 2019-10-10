Extension { #name : #FAMIXAttribute }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXAttribute >> allUsages [
	"check the usage of the variable in the method it is invoked"

	| posUsages methods invocations return |
	"check if the variable is returned by a method"
	return := (self incomingAccesses select: #isReturned)
		ifEmpty: [ {} ]
		ifNotEmpty: [ :list | list first from allUsages ].

	"check the invocation inside methods"
	methods := self incomingAccesses collect: #from.	"self parentType methods."
	posUsages := ((methods
		select: [ :method | method hasSourceAnchor and: [ method isInstanciationInitializer not ] ])
		flatCollect: [ :method | method sourceAnchor findAllOccurrencesOfVariableNamed: self name ])
		asSet.
	invocations := (posUsages
		flatCollect: [ :usage | 
			(self parentType queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage ] ])
		reject: [ :invoc | invoc receiver = self ].
	"Ici il peut y avoir un bug si un widget est ajouté dans une classe anonyme, mais il ne faut pas que l'on pense que l'ajout soit lié au addClickHandler"
	"Il peut aussi y avoir un bug avec le test du sourceAnchor Nil (ça ne devrait jamais etre le cas... mais pour une raison inconnu ca arrivez"
	"invocations
		removeAllSuchThat: [ :invocation | 
			self parentType clientTypes
				anySatisfy: [ :clientType | 
					clientType sourceAnchor isNil
						or: [ clientType isAnonymousClass
								and: [ invocation sourceAnchor intervalAsCharPos
										rangeIncludes: clientType sourceAnchor startPos ] ] ] ]."
	^ {(invocations
		select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ]).
	return} flattened
]
