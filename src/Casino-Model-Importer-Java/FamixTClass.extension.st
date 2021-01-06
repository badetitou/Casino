Extension { #name : #FamixTClass }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> affectation [

	| selfSourceAnchor |
	"Compatibility with invocation for the creation of the widget"
	self isAnonymousClass ifTrue: [ 
		(((self allAtScope: FamixTMethod) select: #hasSourceAnchor) asOrderedCollection sort: [ :method1 :method2 | 
			 method1 sourceAnchor startPos < method2 sourceAnchor startPos ]) ifNotEmpty: [ :theAncessorsMethod | 
			theAncessorsMethod first generateFastIfNotDoneAndBind.
			(self fastDeclaration first atAnyScope: { 
					 FASTJavaAssignementExpression.
					 FASTJavaVariableDeclarator }) ifNotEmpty: [ :aScopeWithOneElement | ^ aScopeWithOneElement anyOne variable famixVariable ] ] ].
	selfSourceAnchor := self sourceAnchor ifNil: [ self container sourceAnchor ].
	^ ((self typeContainer localVariables select: #hasSourceAnchor) select: [ :localVariable | 
		   localVariable sourceAnchor startPos < selfSourceAnchor startPos and: [ localVariable sourceAnchor endPos > selfSourceAnchor endPos ] ]) at: 1 ifAbsent: [ 
		  ((self typeContainer accesses select: #isWrite) select: [ :access | 
			   access sourceAnchor startPos < selfSourceAnchor startPos and: [ access endAffectationPos > selfSourceAnchor endPos ] ]) at: 1 ifAbsent: [ ^ self ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> allUsages [
	^ (self isAnonymousClass and: [ self sourceAnchor isNotNil ])
		ifTrue: [ (self parentPackage ifNil: [ self parents ifNotEmpty: #anyOne ifEmpty: [ nil ] ]) queryAllOutgoingInvocations
				select: [ :el | el sourceAnchor isNotNil and: [ el sourceAnchor startPos < self sourceAnchor startPos and: [ el sourceAnchor endPos > self sourceAnchor endPos ] ] ] ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> findAttributeNamed: anAttributeName [
	(self attributes select: [ :localVariable | localVariable name = anAttributeName ]) ifNotEmpty: [ :results | ^ results at: 1 ].
	^ nil
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> from [
	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self container
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> incomingInstanciations [
	^ (self methods
		select: [ :method | method isConstructor or: [ method signature includesSubstring: method belongsTo name ] ]
		thenCollect: #incomingInvocations) flattened
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> invokedClass [
	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> invokedClassName [
	^ self isAnonymousClass
		ifTrue: [ 
			self name copyFrom: (self name findString: '(') + 1
		to: (self name  findLastOccurrenceOfString: ')' startingAt: 0) - 1 ]
		ifFalse: [ self name ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> isHandlerClass [
	^ '_Anonymous(ClickHandler)' match: self name 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> parameters [

	"I try to extract the initial parameter of an Anonymous class declaration"

	| subString |
	subString := (self typeContainer sourceText copyFrom: 1 to: (self typeContainer sourceText findString: self sourceText)) ifEmpty: [ ^ {  } ].
	^ (subString copyFrom: (subString findLastOccurrenceOfString: 'new' startingAt: 1) to: subString size) extractParameters
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixTClass >> source [

	"I define this method for compatibility purpose with Invocation for method BLWebModel>>#widgetInstance 
	The goal is juste to find if an Anonymous class belongs to the widget namespace or not"

	^ self typeContainer
]
