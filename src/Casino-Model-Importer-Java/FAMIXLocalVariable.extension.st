Extension { #name : #FAMIXLocalVariable }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXLocalVariable >> allUsages [
	"All the invocations the localVariable involved"

	| posUsages |
	self fastAccesses
		ifNotEmpty: [ :accesses | ^ ((accesses difference: self fastDeclaration) select: [ :entity | entity isOfType: FASTJavaMethodInvocation ] thenCollect: #famix) reject: [ :invoc | invoc receiver = self ] ].
	posUsages := self parentBehaviouralEntity sourceAnchor findAllOccurrencesOfVariableNamed: self name.
	^ (((posUsages
		flatCollect: [ :usage | self parentBehaviouralEntity queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil and: [ el sourceAnchor intervalAsCharPos rangeIncludes: usage ] ] ])
		reject: [ :invoc | invoc receiver = self ]) select: [ :usage | usage parameters anySatisfy: [ :param | '*' , self name , '*' match: param ] ])
		ifEmpty: [ self parentBehaviouralEntity allUsages reject: [ :invoc | invoc receiver = self ] ]
]
