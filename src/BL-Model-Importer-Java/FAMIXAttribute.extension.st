Extension { #name : #FAMIXAttribute }

{ #category : #'*BL-Model-Importer-Java' }
FAMIXAttribute >> allUsages [
	| posUsages methods |
	methods := self incomingAccesses select: #isRead thenCollect: #from.	"self parentType methods."
	posUsages := (methods select: [ :method | method hasSourceAnchor and: [ method isInstanciationInitializer not ] ])
		flatCollect: [ :method | method sourceAnchor findAllOccurrencesOfVariableNamed: self name ].
	^ ((posUsages
		flatCollect: [ :usage | 
			(self parentType outgoingInvocations select: [ :el | el sourceAnchor isNotNil ])
				select: [ :out | out sourceAnchor intervalAsCharPos rangeIncludes: usage  ] ]) reject: [ :invoc | invoc receiver = self ])
		select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ]
]
