Extension { #name : #FamixTLocalVariable }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTLocalVariable >> allUsages [
	"All the invocations the localVariable involved"

	| posUsages |
	posUsages := self parentBehaviouralEntity sourceAnchor findAllOccurrencesOfVariableNamed: self name.
	^ (((posUsages
		flatCollect:
			[ :usage | self parentBehaviouralEntity queryAllOutgoingInvocations select: [ :el | el hasSourceAnchor and: [ el sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ])
		reject: [ :invoc | invoc receiver = self ]) select: [ :usage | usage parameters anySatisfy: [ :param | param includesSubstring: self name ] ])
		ifEmpty: [ self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ]
]
