Extension { #name : #FAMIXParameter }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXParameter >> allUsages [
	"All the invocations the localVariable involved"

	| posUsages |
	 "self fastAccesses
		ifNotEmpty: [ :accesses | ((accesses difference: self fastDeclaration) select: [ :entity | entity isOfType: FASTJavaMethodInvocation ] thenCollect: #famix) reject: [ :invoc | invoc receiver = self ] ]
		ifEmpty: [" posUsages := self parentBehaviouralEntity sourceAnchor findAllOccurrencesOfVariableNamed: self name.
	^		(((posUsages
				flatCollect: [ :usage | self parentBehaviouralEntity queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil and: [ el sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ])
				reject: [ :invoc | invoc receiver = self ]) select: [ :usage | usage parameters anySatisfy: [ :param | param includesSubstring: self name ] ])
				ifEmpty: [ self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ] "]"
]
