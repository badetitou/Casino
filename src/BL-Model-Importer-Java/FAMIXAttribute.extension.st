Extension { #name : #FAMIXAttribute }

{ #category : #'*BL-Model-Importer-Java' }
FAMIXAttribute >> allUsages [
	| posUsages methods invocations |
	methods := self incomingAccesses collect: #from.	"self parentType methods."
	posUsages := ((methods select: [ :method | method hasSourceAnchor and: [ method isInstanciationInitializer not ] ])
		flatCollect: [ :method | method sourceAnchor findAllOccurrencesOfVariableNamed: self name ]) asSet.
	"Ici il peut y avoir un bug si un widget est ajouté dans une classe anonyme, mais il ne faut pas que l'on pense que l'ajout soit lié au addClickHandler"
	invocations := ((posUsages
		flatCollect: [ :usage | 
			(self parentType outgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage  ] ]) reject: [ :invoc | invoc receiver = self ]).
	invocations removeAllSuchThat: [ :invocation | self parentType clientTypes anySatisfy: [:clientType | clientType isAnonymousClass and: [ invocation sourceAnchor intervalAsCharPos rangeIncludes: clientType sourceAnchor startPos ] ] ].
	^ invocations select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ]
]
