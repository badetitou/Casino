Extension { #name : #FAMIXInvocation }

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> affectation [
	| selfSourceAnchor |
	"Bug de self sourceAnchor avec l'appli RH"
	selfSourceAnchor := self sourceAnchor ifNotNil: [ self sourceAnchor ] ifNil: [ self from sourceAnchor ].
	"in the case of
			TreeItemCopie service3 = new TreeItemCopie(new BLLabel(""SRHA - Service RH - Absences""));
	The BLLabel affectation must not be serivice3 (it is wrong)
"
	self container ifNotNil: [ ^ nil ].
	^ ((self from localVariables select: [ :el | el sourceAnchor isNotNil ])
		select: [ :localVariable | localVariable sourceAnchor startPos < self sourceAnchor startPos and: [ localVariable sourceAnchor endPos > self sourceAnchor endPos ] ])
		at: 1
		ifAbsent: [ ((self from accesses select: #isWrite) select: [ :access | access sourceAnchor startPos < self sourceAnchor startPos and: [ access sourceAnchor endPos + 5 > self sourceAnchor startPos ] ])
				at: 1
				ifAbsent: [ self from isInstanciationInitializer
						ifTrue: [ (((self from atScope: FAMIXClass) at: 1) attributes select: [ :attribute | attribute sourceAnchor startPos < self sourceAnchor startPos and: [ attribute sourceAnchor endPos > self sourceAnchor endPos ] ])
								at: 1
								ifAbsent: [ ^ nil ] ] ] ]
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> allContainers [
	^ self container
		ifNotNil: [ :container | 
			{self container.
			container allContainers} flattened ]
		ifNil: [ {} ]
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> attributeName [
	^ (signature copyFrom: 4 to: ((signature findString: '(') - 1)) asLowercase.
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> container [
	self sourceAnchor ifNil: [ ^ nil ].
	^ ((self from outgoingInvocations
		select: [ :invocation | 
			invocation sourceAnchor isNotNil
				and: [ self sourceAnchor startPos > invocation sourceAnchor startPos
						and: [ self sourceAnchor endPos < invocation sourceAnchor endPos ] ] ])
		sort:
			[ :invocationA :invocationB | invocationA sourceAnchor startPos > invocationB sourceAnchor startPos ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> invokedClass [
	^ (self candidates at: 1) parentType 
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> invokedClassName [
	^ self invokedClass invokedClassName
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> isGetter [
	^ self signature prefixMatchesRegex: 'get'.
]

{ #category : #'*BL-Model-Importer-Java' }
FAMIXInvocation >> parameters [
	^ signature extractParameters 
]
