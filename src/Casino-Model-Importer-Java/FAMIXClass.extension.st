Extension { #name : #FAMIXClass }

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> affectation [
	"Compatibility with invocation for the creation of the widget"

	| selfSourceAnchor |
	selfSourceAnchor := self sourceAnchor ifNotNil: [ self sourceAnchor ] ifNil: [ self container sourceAnchor ].
	^ ((self container localVariables select: [ :el | el sourceAnchor isNotNil ])
		select: [ :localVariable | localVariable sourceAnchor startPos < selfSourceAnchor startPos and: [ localVariable sourceAnchor endPos > selfSourceAnchor endPos ] ])
		at: 1
		ifAbsent: [ ((self container accesses select: #isWrite) select: [ :access | access sourceAnchor startPos < selfSourceAnchor startPos and: [ access endAffectationPos > selfSourceAnchor endPos ] ])
				at: 1
				ifAbsent: [ ^ self ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> allUsages [
	^ (self isAnonymousClass and: [self sourceAnchor isNotNil]) ifTrue: [ self belongsTo queryAllOutgoingInvocations select: [ :el | el sourceAnchor isNotNil and: [  el sourceAnchor startPos < self sourceAnchor startPos and: [ el sourceAnchor endPos > self sourceAnchor endPos ] ]  ] ] ifFalse: [ OrderedCollection new  ]
	
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> findAttributeNamed: anAttributeName [
	(self attributes select: [ :localVariable | localVariable name = anAttributeName ]) ifNotEmpty: [ :results | ^ results at: 1 ].
	^ nil
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> from [
	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self container
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> incomingInstanciations [
	^ (self methods
		select: [ :method | method isConstructor or: [ method signature includesSubstring: method belongsTo name ] ]
		thenCollect: #incomingInvocations) flattened
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> invokedClass [
	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self 
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> invokedClassName [
	^ self isAnonymousClass
		ifTrue: [ self name copyFrom: (self name findString: '(') + 1
		to: (self name  findLastOccurrenceOfString: ')' startingAt: 0) - 1 ]
		ifFalse: [ self name ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> isHandlerClass [
	^ 'anonymous(ClickHandler)' match: self name 
]

{ #category : #'*Casino-Model-Importer-Java' }
FAMIXClass >> parameters [
	"I try to extract the initial parameter of an Anonymous class declaration"
	| subString |
	subString :=(self container sourceText
		copyFrom: 1
		to: (self container sourceText findString: self sourceText)) ifEmpty: [^ {}].
	^ (subString copyFrom: (subString findLastOccurrenceOfString: 'new' startingAt: 1) to: subString size) extractParameters
]
