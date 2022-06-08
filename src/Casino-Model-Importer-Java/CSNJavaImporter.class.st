Class {
	#name : #CSNJavaImporter,
	#superclass : #CSNWebModel,
	#instVars : [
		'affectationsToWidget',
		'possibleAddWidgetVisitorClass',
		'possibleAddInvocationVisitor',
		'possibleAddInvocationVisitorClass',
		'addWidgetVisitor',
		'defaultChildrenWidgetsFromInvocationOfWidgetVisitor'
	],
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #accessing }
CSNJavaImporter >> addWidgetVisitor [

	^ addWidgetVisitor
]

{ #category : #accessing }
CSNJavaImporter >> addWidgetVisitor: anObject [

	addWidgetVisitor := anObject
]

{ #category : #accessing }
CSNJavaImporter >> addWidgetVisitorClass [
	^ possibleAddWidgetVisitorClass ifNil: [ 
		  possibleAddWidgetVisitorClass := CSNJavaAddWidgetVisitor ]
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> affectationsToWidget [

	"this is a cache"

	^ affectationsToWidget ifNil: [ 
		  affectationsToWidget := CSNMultiValueDictionary newFrom:
			                          (self model allCSNWidget flatCollect: [ 
				                           :widget | 
				                           widget sources
					                           select: #isInvocation
					                           thenCollect: [ :source | 
					                           source affectation -> widget ] ]) ]
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> computeChildrenOf: widget [

	((self computeOutgoingAddInvocationForWidget: widget) collect: [ 
		 :invoc | 
		 (self searchWidgetsFromAddInvocation: invoc for: widget) -> invoc ]) 
		do: [ :assocWidgetsWithAddInvoc |
			assocWidgetsWithAddInvoc key do: [ :foundWidget | 
				| widgetToAdd |
				widgetToAdd := (foundWidget widgetContainer isNotNil or: [ 
					                foundWidget cellOwner isNotNil ])
					               ifTrue: [ 
						               | copy |
						               copy := foundWidget verticalVeryDeepCopy.
						               (copy recursiveWidgets , { copy }) flattened
							               select: [ :wid | 
							               wid isContainer and: [ wid children isEmpty ] ]
							               thenDo: [ :wid | 
								               self
									               execute: [ self computeChildrenOf: wid ]
									               recordedAs:
										               (String streamContents: [ :stream | 
											                stream << 'Compute child: '
											                << wid printString << ' of '
											                << foundWidget printString ]) ].
						               copy ]
					               ifFalse: [ foundWidget ].
				self addWidgetVisitor
					addWidget: widgetToAdd
					to: widget
					withInvocationOfAdd: assocWidgetsWithAddInvoc value
					usingFactory: self factory ] ]
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> computeOutgoingAddInvocationForWidget: aWidget [

	| invocations |
	invocations := self computeOutgoingInvocationForWidget: aWidget.
	^ (invocations select: [ :receivingInvocation | 
		   (receivingInvocation sender parentType = aWidget realClass or: [ 
			    (aWidget realClass isNotNil and: [ 
				     aWidget realClass isAnonymousClass and: [ 
					     receivingInvocation sender parentType
					     = aWidget realClass superclass ] ]) or: [ 
				    aWidget sources anySatisfy: [ :source | 
					    source isInvocation not or: [ 
						    receivingInvocation sender parentType
							    withSuperclassHierarchy includes: source sender parentType ] ] ] ]) 
			   and: [ 
				   self possibleAddInvocationVisitor
					   is: receivingInvocation
					   correctForWidget: aWidget ] ]) asSet
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> computeOutgoingInvocationForWidget: aWidget [

	| invocations exploreLocalMethod targetMethod |
	invocations := OrderedCollection new.
	targetMethod := (aWidget source class usesTrait: FamixTMethod)
		                ifTrue: [ aWidget source ]
		                ifFalse: [ 
			                ((aWidget source class usesTrait: FamixTClass) 
				                 and: [ aWidget source isAnonymousClass ])
				                ifTrue: [ aWidget source typeContainer ]
				                ifFalse: [ 
					                (aWidget source class usesTrait: FamixTParameter)
						                ifTrue: [ 
						                aWidget source parentBehaviouralEntity ]
						                ifFalse: [ 
							                (aWidget source signature beginsWith: 'super(')
								                ifTrue: [ "I look at how I am built instead of my super class" 
									                aWidget source sender ]
								                ifFalse: [ aWidget source target first ] ] ] ].
	(aWidget source class usesTrait: FamixTParameter)
		ifTrue: [ "special case if it is a parameter" 
			invocations addAll: aWidget source receivingInvocations ]
		ifFalse: [ "first look for places my variable (if one) is used as a parameter"
			aWidget variable ifNotNil: [ :variable | 
				aWidget source generateFastIfNotDoneAndBind.
				variable fastAccesses do: [ :fastAccess | 
					fastAccess argumentOwner ifNotNil: [ "If argument owner is not nil, this access is a parameter of the target method"
						| invoc |
						invoc := (fastAccess atAnyScope: { 
								          FASTJavaMethodInvocation.
								          FASTJavaNewExpression }) anyOneIfOnlyOneElement
							         famixInvocation.

						(invoc isNil or: [ invoc candidates anyOne isStub ]) ifFalse: [ 
							| index |
							index := fastAccess argumentOwner arguments asOrderedCollection 
								         indexOf: fastAccess.
							invoc candidates anyOne parameters size >= index ifTrue: [ 
								invocations addAll:
									(invoc candidates anyOne parameterAtIndex: index)
										receivingInvocations ]
									ifFalse: [ "the method should be of this form: myMethod(SomeClass ... att)" ] ] ] ] ].
			"Then general cases"
			invocations addAll:
				(targetMethod outgoingInvocations select: [ :invoc | 
					 invoc receiver isNotNil and: [ 
						 invoc receiver isImplicitVariable ] ]) ].
	targetMethod isConstructor ifTrue: [ "I might understand stuff based of parameters of the invocations of the constructor"
		(aWidget source isKindOf: FamixJavaInvocation) ifTrue: [ 
			invocations add: aWidget source.
			aWidget source generateFastIfNotDoneAndBind.
			(aWidget source fast receiverOwner isNotNil and: [ 
				 aWidget source fast receiverOwner isKindOf:
					 FASTJavaMethodInvocation ]) ifTrue: [ 
				invocations add: aWidget source fast receiverOwner famixInvocation ] ].
		invocations addAll:
			((self retrievedLocalCallFlowOf: targetMethod) flatCollect: [ 
				 :method | 
				 method queryAllOutgoingInvocations select: [ :invoc | 
					 invoc receiver isNotNil and: [ 
						 invoc receiver isImplicitVariable ] ] ]).
		"If target method is constructor of anonymous class repeat for anonymous"
		targetMethod parentType isAnonymousClass ifTrue: [ 
			targetMethod parentType superclass methods
				select: [ :m | m isConstructor ]
				thenDo: [ :superclassConstructor | 
					invocations addAll:
						((self retrievedLocalCallFlowOf: superclassConstructor) 
							 flatCollect: [ :method | 
								 method queryAllOutgoingInvocations select: [ :invoc | 
									 invoc receiver isNotNil and: [ 
										 invoc receiver isImplicitVariable ] ] ]) ] ] ].
	invocations addAll:
		(targetMethod classes collect: [ :aFamixJavaClass | 
			 aFamixJavaClass queryLocalOutgoing: FamixTInvocation ]) flatten.
	exploreLocalMethod := invocations copy.
	[ exploreLocalMethod isNotEmpty ] whileTrue: [ 
		invocations addAll: ((exploreLocalMethod flatCollect: [ :invoc | 
				  invoc target first outgoingInvocations ]) select: [ :invoc | 
				 targetMethod belongsTo = invoc source belongsTo and: [ 
					 invoc receiver isNil or: [ invoc receiver isImplicitVariable ] ] ]).
		exploreLocalMethod := (exploreLocalMethod flatCollect: [ :invoc | 
			                       invoc target first outgoingInvocations ]) 
			                      select: [ :invoc | 
			                      invoc target first = targetMethod ] ].
	(self isWidgetReturned: aWidget) ifTrue: [ 
		| sourceMethod |
		sourceMethod := ((aWidget source class usesTrait: FamixTClass) and: [ 
			                 aWidget source isAnonymousClass ])
			                ifTrue: [ aWidget source typeContainer ]
			                ifFalse: [ aWidget source sender ].
		(sourceMethod incomingInvocations
			 collect: #affectation
			 thenSelect: #isNotNil) do: [ :variableOfMethodThatCallMe | 
			variableOfMethodThatCallMe isNotFound ifFalse: [ 
				invocations addAll:
					variableOfMethodThatCallMe receivingInvocations ] ] ]. "Test if the variable is returned"

	aWidget variable ifNotNil: [ :variable | 
		invocations addAll: variable receivingInvocations ].

	invocations
		select: [ :invoc | invoc signature beginsWith: 'getContentPane' ]
		thenDo: [ :invoc | 
			invoc generateFastIfNotDoneAndBind.
			(invoc fast receiverOwner isKindOf: FASTJavaMethodInvocation) 
				ifTrue: [ 
				invocations add: invoc fast receiverOwner famixInvocation ] ].
	^ invocations flattened asSet
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> isWidgetReturned: aWidget [

	^ (aWidget variable isNotNil and: [ 
		   aWidget variable fastAccesses anySatisfy: [ :access | "Test if the variable is returned"
			   ((access atScope: FASTTBehaviouralEntity) isNotEmpty and: [ 
				    (access atScope: FASTTBehaviouralEntity) anyOne famixMethod
				    = (((aWidget source class usesTrait: FamixTClass) and: [ 
						      aWidget source isAnonymousClass ])
						     ifTrue: [ aWidget source typeContainer ]
						     ifFalse: [ aWidget source sender ]) ]) and: [ 
				   (access atAnyScope: { 
						    FASTJavaReturnStatement.
						    FASTJavaClassDeclaration.
						    FASTTBehaviouralEntity }) anyOne isKindOf:
					   FASTJavaReturnStatement ] ] ]) or: [ 
		  (aWidget source isKindOf: FamixJavaInvocation) and: [ 
			  aWidget source isReturned ] ]
]

{ #category : #accessing }
CSNJavaImporter >> possibleAddInvocationVisitor [

	^ possibleAddInvocationVisitor
]

{ #category : #accessing }
CSNJavaImporter >> possibleAddInvocationVisitor: anObject [

	possibleAddInvocationVisitor := anObject
]

{ #category : #accessing }
CSNJavaImporter >> possibleAddInvocationVisitorClass [

	^ possibleAddInvocationVisitorClass ifNil: [ 
		  possibleAddInvocationVisitorClass := CSNJavaPossibleAddInvocationVisitor ]
]

{ #category : #accessing }
CSNJavaImporter >> possibleAddInvocationVisitorClass: anObject [

	^ possibleAddInvocationVisitorClass := anObject
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> preImport [

	super preImport.
	possibleAddInvocationVisitor := self
		                                possibleAddInvocationVisitorClass
		                                new.
	addWidgetVisitor := self addWidgetVisitorClass new
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> retrievedLocalCallFlowOf: aFamixJavaMethod [

	| methods currentSize |
	methods := Set new.
	methods add: aFamixJavaMethod.
	[ currentSize ~= methods size ] whileTrue: [ 
		currentSize := methods size.
		methods addAll: (methods flatCollect: [ :method | 
				 method queryAllOutgoingInvocations
					 collect: [ :invoc | invoc target anyOne ]
					 thenSelect: [ :invoc | 
					 invoc parentType = aFamixJavaMethod parentType ] ]) ].
	^ methods
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> searchInstatiateVariable: var [

	| listOfinvocation |
	listOfinvocation := (var incomingAccesses select: #isWrite) 
		                    flatCollect: [ :access | 
			                    access source outgoingInvocations select: [ 
				                    :invoc | 
				                    access sourceAnchor startPos
				                    < invoc sourceAnchor startPos and: [ 
					                    access sourceAnchor endPos + 5
					                    > invoc sourceAnchor startPos ] ] ].
	"If attribute, check if the instaciation is made directly and not inside the constructor"
	(listOfinvocation isEmpty and: [ var isAttribute ]) ifTrue: [ 
		listOfinvocation := (var parentType outgoingInvocations select: [ 
			                     :invoc | 
			                     invoc from isInstanciationInitializer and: [ 
				                     var sourceAnchor startPos
				                     < invoc sourceAnchor startPos and: [ 
					                     var sourceAnchor endPos + 5
					                     > invoc sourceAnchor startPos ] ] ])
			                    asOrderedCollection ].
	"We don't have access to the write accesses... so we try to find directly inside the method"
	listOfinvocation ifEmpty: [ 
		listOfinvocation := var parentBehaviouralEntity outgoingInvocations 
			                    select: [ :invoc | 
				                    var sourceAnchor startPos
				                    < invoc sourceAnchor startPos and: [ 
					                    var sourceAnchor endPos + 5
					                    > invoc sourceAnchor startPos ] ] ].
	listOfinvocation ifEmpty: [ ^ nil ] ifNotEmpty: [ 
		^ (listOfinvocation select: [ :invoc | 
			   invoc target first isConstructor ]) first ]
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> searchWidgetsFromAddInvocation: addInvocation for: aWidget [

	"possibleVariables is used to retrieve widget that is affected to this variable (best way)
	possibleInvocations is used at the end to retrieve widget that was created using this invocations"

	| arguments widgets |
	widgets := OrderedCollection new.
	addInvocation sender generateFastIfNotDoneAndBind.
	arguments := CSNJavaArgumentsFromInvocationOfWidget
		             argumentFrom: addInvocation
		             for: aWidget.
	arguments do: [ :argument | 
		widgets addAll:
			(self searchWidgetsFromArgument: argument for: aWidget) ].
	^ widgets
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> searchWidgetsFromArgument: anArgument for: aWidget [

	| var possibleVariables possibleInvocations |
	possibleVariables := OrderedCollection new.
	possibleInvocations := OrderedCollection new.
	var := (anArgument isKindOf: FASTJavaCastExpression)
		       ifTrue: [ anArgument expression famixVariable ]
		       ifFalse: [ 
			       anArgument famixVariable ifNil: [ 
				       (anArgument isKindOf: FASTJavaAssignementExpression)
					       ifTrue: [ anArgument variable famixVariable ]
					       ifFalse: [ nil ] ] ].
	(var isNil and: [ anArgument isKindOf: FASTJavaMethodInvocation ]) 
		ifTrue: [ "This is probably something like
		myWidget.add(anotherMethod());
		So, take invocation add().
		Take first param *anotherMethod()*
		Search the return statement of *anotherMethod()*
		Retrieved the returned variable (in which should be the targeted widget)
		"
			| targetMethod |
			targetMethod := anArgument famixInvocation candidates
				                anyOneIfOnlyOneElement.
			targetMethod hasSourceAnchor ifTrue: [ 
				targetMethod returnedFamixVariable
					ifNotNil: [ :famixVariable | var := famixVariable ]
					ifNil: [ 
						targetMethod returnedFamixInvocation ifNotNil: [ :invok | 
							possibleInvocations add: invok ] ] ] ].
	(self widgetsInVariable: var forWidget: aWidget) ifNotEmpty: [ :wid | 
		^ wid ].
	"check other possible variable"
	"Does this variable has been affected after an invocation? 
	if true: another variable is the one returned by the target method"
	var ifNotNil: [ 
		var fastDeclaration
			reject: [ :declaration | declaration isKindOf: FASTJavaParameter ]
			thenDo: [ :declaration | 
				(declaration expression isKindOf: FASTJavaMethodInvocation) 
					ifTrue: [ 
						| targetMethod |
						targetMethod := declaration expression famixInvocation
							                candidates anyOneIfOnlyOneElement.
						targetMethod hasSourceAnchor ifTrue: [ 
							targetMethod returnedFamixVariable
								ifNotNil: [ :famixVariable | 
								possibleVariables add: famixVariable ]
								ifNil: [ 
								possibleInvocations add: targetMethod returnedFamixInvocation ] ] ] ].
		"If does not work with basic research"
		possibleVariables do: [ :variable | 
			(self widgetsInVariable: variable forWidget: aWidget) ifNotEmpty: [ 
				:wid | ^ wid ] ] ].
	"Our argument looks like blabla(arg1,arg2, new MyArgument()) or: blbla(callToFactory())"
	((anArgument isKindOf: FASTJavaNewExpression) or: [ 
		 anArgument isKindOf: FASTJavaMethodInvocation ]) ifTrue: [ 
		possibleInvocations add: anArgument famixInvocation ].
	possibleInvocations do: [ :invoc | 
		(self widgetCreatedWithInvocation: invoc) ifNotNil: [ :wid | 
			^ { wid } ] ].
	"The variable is a parameter and thus the widget comes from another method (look for Hello call of ui test ressources)"
	(anArgument famixVariable isKindOf: FamixJavaParameter) ifTrue: [ 
		anArgument famixVariable parentBehaviouralEntity incomingInvocations 
			do: [ :invoc | 
				| reverseFlowRetrievedVariable |
				invoc generateFastIfNotDoneAndBind.
				reverseFlowRetrievedVariable := (invoc fast arguments at:
					                                 anArgument famixVariable
						                                 parameterIndex) famixVariable.
				(self
					 widgetsInVariable: reverseFlowRetrievedVariable
					 forWidget: aWidget) ifNotEmpty: [ :wid | ^ wid ] ] ].
	^ {  }
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> widgetCreatedWithInvocation: anInvocation [

	"First check if the variable is the variable for a widget.
	If not check at the type level.
THIS CANNOT BE IN THE OTHER WAY"

	anInvocation ifNil: [ ^ nil ].
	^ self model allCSNWidget
		  detect: [ :el | el sources anySatisfy: [ :source | source = anInvocation ]  ]
		  ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
CSNJavaImporter >> widgetsInVariable: aVariable forWidget: aWidget [

	"First check if the variable is the variable for a widget.
	aWidget can be used if you look for a source in the context of the widget **parent**"

	aVariable ifNil: [ ^ {  } ].
	^ self affectationsToWidget
		  at: aVariable
		  ifPresent: [ :widgets | 
			  widgets size = 1 ifTrue: [ ^ { widgets anyOne } ].
			  (widgets select: [ :widget | 
				   aWidget sources size = 1 or: [ 
					   (widget sources size >= 2 and: [ 
						    aWidget sources second owningClass
						    = widget sources second owningClass ]) or: [ 
						   aWidget sources anySatisfy: [ :aWidgetSource | 
							   aWidgetSource owningClass = widget sources first owningClass ] ] ] ])
				  ifNotEmpty: [ :selectedWidgets | selectedWidgets ]
				  ifEmpty: [ {  } ] ]
		  ifAbsent: [ {  } ]
]
