Extension { #name : #FamixTParameter }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTParameter >> allUsages [
	"All the invocations the parameter is involved"

	| posUsages |
	posUsages := self parentBehaviouralEntity sourceAnchor findAllOccurrencesOfVariableNamed: self name.
	^ (((posUsages
		flatCollect: [ :usage | 
			self parentBehaviouralEntity queryAllOutgoingInvocations
				select: [ :el | el sourceAnchor isNotNil and: [ el sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ]) reject: [ :invoc | invoc receiver = self ])
		select: [ :usage | usage parameters anySatisfy: [ :param | param includesSubstring: self name ] ])
		ifEmpty: [ "]" self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ]
]
