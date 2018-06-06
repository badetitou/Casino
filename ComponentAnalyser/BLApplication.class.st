"
aw := AnalyseCommand new.

fileName := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'. xml := aw getXmlFile: fileName.

MooseModel resetRoot. MooseModel resetMeta.

"" mseFile := StandardFileStream fileNamed: '/home/badetitou/Document/PFE/output.mse' . ""

""mseFile := StandardFileStream fileNamed: '/home/badetitou/Document/PFE/General.mse' .""

mseFile := StandardFileStream fileNamed: 'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .

mooseModel := MooseModel importFromMSEStream: mseFile .

mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.

MooseModel root add: mooseModel.

blApp := BLApplication new model: mooseModel; applicationXml: xml; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

blApp model.

blApp phases.

blApp modelPhases.

blApp phasesLink.

blApp linkPhaseView.

blApp modelPageMetier.

blApp linkPageMetierAndPhase.

blApp linkPageMetierAndPhaseConstructor.

blApp linkViewPhasePage.

blApp modelWidget.

blApp linkFromConstructor.

blApp getConstructor. blApp getWidgetConstructor.

blApp modelWidgetInstance.

blApp resetCache. blApp linkViewWithExternalWidget.

blApp resetCache. blApp linkView.

blApp modelWidgetInstanceFromPhaseAndPageMetier.

blApp modelWidgetInstanceFromPhaseAndPageMetier collect: [:a | blApp getPotentialAttributeFromConstructor: a constructor].

blApp resetCache. 
blApp linkViewWidgetInstanceFromPhaseAndPageMetier.

blApp linkWidgetFromPPPhase. 
blApp linkViewPPWidget.

blApp linkViewPPWidgetHighlightCallPhaseWidget.

blApp linkXmlUi. 
blApp linkViewPPWXmlUI.

blApp modelServices. 
blApp modelAsync.

blApp linkPhaseOrPageMetierToAsync. 
blApp linkWidgetToService.

blApp linkViewPPWXmlUIService.

blApp resetCache. blApp modelContentWidget. 
blApp modelContentWidgetInstance.

blApp linkViewPPContentWXmlUIService.

blApp usageOfmodelWidgetInstanceFromPhaseAndPageMetierPerPP. 
blApp usageOfmodelWidgetInstanceFromPhaseAndPageMetier. 
blApp notUsedModelWidgetInstanceFromPhaseAndPageMetier.

""------------------ Adherence ----------------""

blApp modelWidget. blApp viewsWidget. 
blApp infoAnonymousWidget.

blWid := BLWidgetAnalysis new model: mooseModel; appTools: blApp. blWid resetCache. 
blWid modelWidget. 
blWid computeMetrics.

blWid viewDependancyHeritCore. 
blWid viewDependancyHeritCoreAndDepth: 1. 
blWid viewDependancyHeritCoreAndReferencesAndDepth: 5. 
blWid viewReferences. 
blWid viewGroupReferencesForDepth: 0.

blWid modelWidget.

blWid widgetDefinition. 
blWid viewAll.

""------------- Adherence App -> Core ---------""

blWid viewReferencesToLeaf. 
blWid viewReferencesToNoLeaf. 
blWid viewReferencesToWidgetInterface.

""### Compute best to start migration App ###""

blWid computeBestMigrationOrder.

blWid groupWithDepth: 0.

blApp usageOfmodelWidgetInstanceFromPhaseAndPageMetierPerPP. 
blApp usageOfmodelWidgetInstanceFromPhaseAndPageMetier. 
blApp notUsedModelWidgetInstanceFromPhaseAndPageMetier.

""------------- Adherence App -> GWT ---------""

blWid viewReferencesAppToGWT.

blWid usageOfGWTWidgetPP.
blWid usageOfGWTWidget.

""-------------- glamour -------------------""

blWid openGlamour
"
Class {
	#name : #BLApplication,
	#superclass : #Object,
	#instVars : [
		'applicationXml',
		'model',
		'cacheModelPhases',
		'modelWidgetInstanceCache',
		'linkFromConstructorCache',
		'modelWidgetCache',
		'modelWidgetInstanceFromPhaseAndPageMetierCache',
		'linkWidgetFromPPPhaseCache',
		'phasesCache',
		'sourceApp',
		'sourceCore',
		'modelAsyncCache',
		'cacheModelService',
		'modelContentWidgetCache',
		'modelContentWidgetInstanceCache',
		'linkFromConstructorWithoutSuperCall'
	],
	#category : 'ComponentAnalyser'
}

{ #category : #accessing }
BLApplication >> applicationXml [
	^ applicationXml
]

{ #category : #accessing }
BLApplication >> applicationXml: anObject [
	applicationXml := anObject
]

{ #category : #accessing }
BLApplication >> blNamespace [
	^ 'fr::bl::*'
]

{ #category : #accessing }
BLApplication >> classComplexityFor: aClass [
	| view links attributes references |
	links := aClass superInheritances collect: [ :herit | Association new key: aClass value: (self getClassFromHeritance: herit) ].
	attributes := aClass attributes collect: [ :attr | Association new key: aClass value: attr declaredType ].
	references := aClass queryAll: #in.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(references includes: cl)
				ifTrue: [ Color orange ]
				ifFalse: [ (self blNamespace match: cl container mooseName)
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value).
			references} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges
		useAssociations:
			{links.
			(references asOrderedCollection flatCollect: [ :a | {(a -> aClass)} ])} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]

{ #category : #accessing }
BLApplication >> collectAssociationFrom: e [
	^ (self searchCandidatesInvokingPhaseFromAssociation: e)
		collect: [ :a | Association new key: a value: (self searchCalledPhase: e) ].
]

{ #category : #accessing }
BLApplication >> computeInfoAnonymousWidget: anAnonymousWidget [
	^ {(#nLOC -> anAnonymousWidget numberOfLinesOfCode).
	(#classomplexity -> (self classComplexityFor: anAnonymousWidget)).
	(#redefinedMethod -> (anAnonymousWidget methods select: #isOverriding ))} asDictionary
]

{ #category : #accessing }
BLApplication >> computeWidgetView: widget [
	| view classes links attributes |
	view := RTMondrian new.
	classes := {widget superclassHierarchyGroup.
	{widget}} flatten.
	attributes := (classes
		flatCollect: [ :class | class attributes collect: [ :attr | Association new key: class value: attr declaredType ] ])
		asOrderedCollection.
	links := classes
		flatCollect: [ :class | class superInheritances collect: [ :herit | Association new key: class value: (self getClassFromHeritance: herit)] ].
	view shape circle
		color: [ :cl | 
			(self modelWidget includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ ((attributes collect: #value) includes: cl)
						ifTrue: [ Color red ]
						ifFalse: [ Color blue ] ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value).
			(attributes collect: #key).
			(attributes collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges
		useAssociations:
			{links.
			attributes} flatten.
	view treeLayout.
	^ view
]

{ #category : #accessing }
BLApplication >> correspondingAccesses: aListOfAccesses toInvocation: anInvocation [
	^ ((aListOfAccesses select: [ :access | access sourceAnchor startPos < anInvocation sourceAnchor startPos ]) sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) ifNotEmpty: [:a | a last ] ifEmpty: [ ^ nil ]
]

{ #category : #accessing }
BLApplication >> generatePhaseFromXmlElement: xmlElement [
	^ BLCAPhase new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | a replaceAllRegex: '\.' with: '::' ]
				ifNil: [ ((self model allModelClasses
						select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ]) at: 1)mooseName ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue)
]

{ #category : #accessing }
BLApplication >> getClassFromHeritance: herit [
	herit value to isParameterizedType ifTrue: [ ^ herit value to parameterizableClass  ].
	^ herit value to
]

{ #category : #accessing }
BLApplication >> getConstructor [
	^ self model allModelMethods
				select: #isConstructor
	
]

{ #category : #accessing }
BLApplication >> getContentWidgetConstructor [
	| modelWidget |
	modelWidget := self modelContentWidget.
	^ self getConstructor select: [ :method | modelWidget includes: method parentType ]
]

{ #category : #accessing }
BLApplication >> getPhaseClassFrom: realClassName [
	realClassName ifNil: [ ^self ].
	^ (self model allClasses select: [ :e | realClassName = e mooseName ]) at: 1
]

{ #category : #accessing }
BLApplication >> getPhaseNamed: aClassName [
	^ ((self phases select: [ :e | e codePhase = aClassName  ]) at: 1) realClassName
]

{ #category : #accessing }
BLApplication >> getPotentialAttributeFromConstructor: aConstructor [
	self flag: #stillWorkToDoWithLocalVariable.
	aConstructor receiver ifNotNil: [:receiver | receiver isImplicitVariable ifTrue: [ ^ aConstructor receiver ] ].
	aConstructor from name = '<Initializer>' ifTrue: [ ^ ((aConstructor from belongsTo attributes select: [ :a | a sourceAnchor startPos < aConstructor sourceAnchor startPos ]) sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) last ].
	^ (( aConstructor from accesses select: [ :access | access isWrite and: [access sourceAnchor endPos < aConstructor sourceAnchor startPos] ] ) sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos  ]) ifNotEmpty: [ :a | a last variable ] ifEmpty: [ ((aConstructor from localVariables select: [ :access | access sourceAnchor isNotNil and: [ access sourceAnchor startPos < aConstructor sourceAnchor startPos ] ] ) sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) ifNotEmpty: [ :a | a last ] ifEmpty: [ ^ #notImplementedYet ] ] .
]

{ #category : #accessing }
BLApplication >> getWidgetConstructor [
	| modelWidget |
	modelWidget := self modelWidget.
	^ self getConstructor
		select: [ :method | modelWidget includes: method parentType ]
]

{ #category : #accessing }
BLApplication >> infoAnonymousWidget [
	^ ((self model allModelClasses
		select: [ :c | 
			c isAnonymousClass
				and: [ (c superInheritances collect: #to)
						anySatisfy: [ :spc | self widgetNamespace match: spc mooseName ] ] ])
		collect: [ :anAnonymousWidget | {(anAnonymousWidget -> (self computeInfoAnonymousWidget: anAnonymousWidget ))} ]) flatten asDictionary
]

{ #category : #accessing }
BLApplication >> isEntityInBlApp: anEntity [
	^ self sourceApp match: ((anEntity atScope: FAMIXClass) at: 1) sourceAnchor fileName 
]

{ #category : #accessing }
BLApplication >> isEntityInBlCore: anEntity [
	^ self sourceCore match: ((anEntity atScope: FAMIXClass) at: 1) sourceAnchor fileName
]

{ #category : #accessing }
BLApplication >> linkForAbstractTabPhase [
	^ (self modelPhases
		select: [ :a | (a withSuperclassHierarchy collect: #name) anySatisfy: [ :name | 'AbstractTabPhaseController' = name ] ]
		thenCollect: [ :class | 
			class withSuperclassHierarchy
				collect: [ :c | 
					(c outgoingInvocations
						reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
						thenCollect: [ :invoc | invoc candidates at: 1 ])
						select: [ :e | e isConstructor and: [ self modelPageMetier includes: e parentType ] ]
						thenCollect: [ :e | class -> e parentType ] ] ]) flatten flatten
]

{ #category : #accessing }
BLApplication >> linkFromConstructor [
	^ linkFromConstructorCache
		ifNil: [ linkFromConstructorCache := (self getConstructor 
				collect: [ :method | 
					| got |
					got := (method queryAll: #in) atScope: FAMIXClass.
					got
						ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ])
				flatten ]
]

{ #category : #accessing }
BLApplication >> linkFromConstructorWithoutSuperCall [
	^ linkFromConstructorWithoutSuperCall
		ifNil: [ linkFromConstructorWithoutSuperCall := (self getConstructor 
				collect: [ :method | 
					| got |
					got := ((method incomingInvocations ) reject: [ :el | el receiver ifNil: [false] ifNotNil: [ :n | n name = #super] ]) collect: [ :a | (a candidates at: 1) parentType ].
					got
						ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ])
				flatten ]
]

{ #category : #accessing }
BLApplication >> linkPageMetierAndPhase [
	^ self modelPageMetier
		flatCollect: [ :page | 
			page incomingReferences
				collect: [ :reference | Association new key: reference from belongsTo value: page ] ]
]

{ #category : #accessing }
BLApplication >> linkPageMetierAndPhaseConstructor [
	^ (self model allModelMethods
		select: #isConstructor
		thenCollect: [ :method | 
			"thenCollect: [ :method | ((method queryAll: #in) atScope: FAMIXClass) from parentType ]"
			| got |
			got := (method queryAll: #in) atScope: FAMIXClass.
			got
				ifNotEmpty: [ got collect: [ :p | Association new key: p value: method parentType ] ] ]) flatten
]

{ #category : #accessing }
BLApplication >> linkPageMetierToPageMetier [
	^ self modelPageMetier
		flatCollect: [ :pageMetier | 
			(pageMetier outgoingInvocations
				reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
				thenCollect: [ :invoc | invoc candidates at: 1 ])
				select: [ :e | e isConstructor and: [ self modelPageMetier includes: e parentType ] ]
				thenCollect: [ :e | pageMetier -> e parentType ] ]
]

{ #category : #accessing }
BLApplication >> linkPhaseOrPageMetierToAsync [
	^ self modelAsync
		collect: [ :asyncClass | 
			Association new
				key: asyncClass
				value: (self searchFirstNotAnonymousClassForClass: asyncClass) ]
]

{ #category : #accessing }
BLApplication >> linkPhasePageMetierToPhasePageMetierFromConstructor [
	^ {(self modelPhases , self modelPageMetier)} flatten
		flatCollect: [ :el | 
			el outgoingInvocations
				select: [ :invoc | (invoc candidates at: 1) isConstructor and: [ (invoc receiver ifNil: [ false ] ifNotNil: [ :i | i name = #super ]) not ] ]
				thenCollect: [ :invoc | el -> (invoc candidates at: 1) parentType ] ]
]

{ #category : #accessing }
BLApplication >> linkPhaseView [
	| view |
	view := RTMondrian new.
	view shape circle color: Color blue lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter lighter .
	(view nodes: (self modelPhases) asSet).
	(view shape line arrowedLine headOffset: 1.0) shape head baseSize: 5.0; size: 8.
	view edges useAssociations: self phasesLink.
	view layout force.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkView [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstance includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier
				, (self modelWidgetInstance reject: [ :el | self widgetNamespace match: el link key mooseName])) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: self phasesLink , self linkFromConstructor , (self modelWidgetInstance collect: #link).
	view layout force strength: 0.2.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPPContentWXmlUIService [
	| view lb |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelContentWidgetInstance includes: cl) ifTrue: [ Color green muchDarker ] ifFalse: [ 
			(self modelAsync includes: cl)
				ifTrue: [ Color tan muchDarker ]
				ifFalse: [ (self modelServices includes: cl)
						ifTrue: [ Color orange ]
						ifFalse: [ (self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
								ifTrue: [ (self linkWidgetName includes: cl widgetClass name)
										ifTrue: [ Color white ]
										ifFalse: [ Color green ] ]
								ifFalse: [ (self modelPhases includes: cl)
										ifTrue: [ (self phaseCanStandalone: cl)
												ifTrue: [ Color yellow ]
												ifFalse: [ Color blue ] ]
										ifFalse: [ Color red ] ] ] ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier , (self linkXmlUi collect: #key)
				, self modelServices , self modelAsync, self modelContentWidgetInstance) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkPhaseOrPageMetierToAsync includes: e)
				ifTrue: [ Color orange ]
				ifFalse: [ (self linkWidgetToService includes: e)
						ifTrue: [ Color orange ]
						ifFalse: [ (self linkWidgetFromPPPhase includes: e)
								ifTrue: [ Color blue ]
								ifFalse: [ Color gray ] ] ] ].
	view edges
		useAssociations:
			self linkWidgetFromPPPhase , (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link)
				, self linkWidgetToService, self linkXmlUiPhaseAndPageMetier, self linkPhaseOrPageMetierToAsync,  self linkPhasePageMetierToPhasePageMetierFromConstructor , (self modelContentWidgetInstance collect: #link), self linkForAbstractTabPhase.
	view layout force strength: 0.4.
	view view pushBackEdges.
	lb := RTLegendBuilder new.
	lb
		view: view view.
	lb addText: 'Legende'.
	lb addColor: Color white text: 'Widget Instance with "click" possibility'.
	lb addColor: Color green text: 'Widget Instance without "click" possibility'.
	lb addColor: Color yellow text: 'Standalone Phase'.
	lb addColor: Color blue text: 'Normal Phase'.
	lb addColor: Color red text: 'Page Metier'.
	lb addColor: Color orange text: 'Service'.
	lb addColor: Color tan muchDarker text: 'AsynchroneClass'.
	lb addLineColor: Color gray text: 'contain'.
	lb addLineColor: Color blue text: 'link action'.
	lb addLineColor: Color orange text: 'link from element to Service'.
	lb build.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPPWXmlUI [
	| view lb |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ (self linkWidgetName includes: cl widgetClass name)
						ifTrue: [ Color white ]
						ifFalse: [ Color green ] ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view nodes: (self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier , (self linkXmlUi collect: #key)) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkWidgetFromPPPhase includes: e)
				ifTrue: [ Color blue ]
				ifFalse: [ Color gray ] ].
	view edges useAssociations: self linkWidgetFromPPPhase , self linkFromConstructor , (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link), self linkXmlUi.
	view layout force strength: 0.4.
	view view pushBackEdges.
		lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor:  Color white text: 'Widget Instance with "click" possibility'.
	lb addColor: Color green text: 'Widget Instance without "click" possibility'.
	lb addColor: Color yellow text: 'Standalone Phase'.
	lb addColor: Color blue text: 'Normal Phase'.
	lb addColor: Color red text: 'Page Metier'.
	lb addLineColor: Color gray text: 'contain'.
	lb addLineColor: Color blue text: 'link action'.
	lb build.
	
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPPWXmlUIService [
	| view lb |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelAsync includes: cl)
				ifTrue: [ Color tan muchDarker ]
				ifFalse: [ (self modelServices includes: cl)
						ifTrue: [ Color orange ]
						ifFalse: [ (self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
								ifTrue: [ (self linkWidgetName includes: cl widgetClass name)
										ifTrue: [ Color white ]
										ifFalse: [ Color green ] ]
								ifFalse: [ (self modelPhases includes: cl)
										ifTrue: [ (self phaseCanStandalone: cl)
												ifTrue: [ Color yellow ]
												ifFalse: [ Color blue ] ]
										ifFalse: [ Color red ] ] ] ] ].
	view nodes: (self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier , (self linkXmlUi collect: #key) , self modelServices , self modelAsync) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkPhaseOrPageMetierToAsync includes: e)
				ifTrue: [ Color orange ]
				ifFalse: [ (self linkWidgetToService includes: e)
						ifTrue: [ Color orange ]
						ifFalse: [ (self linkWidgetFromPPPhase includes: e)
								ifTrue: [ Color blue ]
								ifFalse: [ Color gray ] ] ] ].
	view edges
		useAssociations: self linkWidgetFromPPPhase , self linkFromConstructor , (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link) , self linkXmlUi , self linkWidgetToService , self linkPhaseOrPageMetierToAsync.
	view layout force strength: 0.4.
	view view pushBackEdges.
	lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor: Color white text: 'Widget Instance with "click" possibility'.
	lb addColor: Color green text: 'Widget Instance without "click" possibility'.
	lb addColor: Color yellow text: 'Standalone Phase'.
	lb addColor: Color blue text: 'Normal Phase'.
	lb addColor: Color red text: 'Page Metier'.
	lb addColor: Color orange text: 'Service'.
	lb addColor: Color tan muchDarker text: 'AsynchroneClass'.
	lb addLineColor: Color gray text: 'contain'.
	lb addLineColor: Color blue text: 'link action'.
	lb addLineColor: Color orange text: 'link from element to Service'.
	lb build.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPPWidget [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier)
				asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkWidgetFromPPPhase includes: e)
				ifTrue: [ Color blue ] ifFalse: [ Color gray]].
	view edges
		useAssociations:
			self linkWidgetFromPPPhase , self linkFromConstructor
				, (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link).
	view layout force strength: 0.6.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPPWidgetHighlightCallPhaseWidget [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ (self linkWidgetName includes: cl widgetClass name) ifTrue: [ Color white  ] ifFalse: [ Color green ]  ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view	nodes:(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier)asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line
		color: [ :e | 
			(self linkWidgetFromPPPhase includes: e)
				ifTrue: [ Color blue ]
				ifFalse: [ Color gray ] ].
	view edges
		useAssociations:
			self linkWidgetFromPPPhase , self linkFromConstructor
				, (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link).
	view layout force strength: 0.6.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewPhasePage [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			 (self modelPhases includes: cl)
				ifTrue: [ (self phaseCanStandalone: cl) ifTrue: [Color yellow] ifFalse: [Color blue ] ]
				ifFalse: [ Color red ] ].
	view nodes: (self modelPhases , self modelPageMetier ) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: (self phasesLink, self linkPageMetierAndPhaseConstructor  ).
	view layout force strength: 0.3.

	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewWidgetInstanceFromPhaseAndPageMetier [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstanceFromPhaseAndPageMetier includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view
		nodes:
			(self modelPhases , self modelPageMetier , self modelWidgetInstanceFromPhaseAndPageMetier)
				asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges
		useAssociations:
			self phasesLink , self linkFromConstructor
				, (self modelWidgetInstanceFromPhaseAndPageMetier collect: #link).
	view layout force strength: 0.1.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkViewWithExternalWidget [
	| view |
	view := RTMondrian new.
	view shape circle
		color: [ :cl | 
			(self modelWidgetInstance includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ (self modelPhases includes: cl)
						ifTrue: [ (self phaseCanStandalone: cl)
								ifTrue: [ Color yellow ]
								ifFalse: [ Color blue ] ]
						ifFalse: [ Color red ] ] ].
	view nodes: (self modelPhases , self modelPageMetier , self modelWidgetInstance) asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: self phasesLink , self linkFromConstructor, (self modelWidgetInstance collect: #link) .
	view layout force strength: 0.3.
	view view pushBackEdges.
	^ view
]

{ #category : #accessing }
BLApplication >> linkWidgetFromPPPhase [
	"Action d'appel"
	self flag: #stillWorkToDoWithLocalVariable.
	^ linkWidgetFromPPPhaseCache
		ifNil: [ linkWidgetFromPPPhaseCache := ((self model allMethods
				select: [ :e | e mooseName = 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ]) flatCollect: #incomingInvocations)
				collect: [ :el | 
					| link elConstructor |
					elConstructor := el.
					[ elConstructor isNotNil and: [ (elConstructor candidates at: 1) isConstructor not ] ] whileTrue: [ elConstructor := elConstructor previous ].
					elConstructor
						ifNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									el from belongsTo isAnonymousClass
										ifTrue: [ | expectedVariable |
											expectedVariable := (self correspondingAccesses: (el from belongsTo belongsTo accesses) toInvocation: el) ifNotNil: [ :access | access variable ]
												ifNil: [ self correspondingAccesses: el from belongsTo belongsTo localVariables toInvocation: el ].
											expectedVariable
												ifNotNil: [ (self getPotentialAttributeFromConstructor: aWidgetInvocation constructor) = expectedVariable
														ifTrue: [  link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ] ] ]
						ifNotNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									aWidgetInvocation constructor = elConstructor
										ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ].
					link]
				thenSelect: #isNotNil ]
]

{ #category : #accessing }
BLApplication >> linkWidgetName [
	^ { 'BLLinkLabel'. 'BLLinkButton' }.
]

{ #category : #accessing }
BLApplication >> linkWidgetToService [
	^ self modelAsync
		collect: [ :asyncClass | 
			| to |
			to := (asyncClass belongsTo outgoingInvocations
				flatCollect: [ :b | 
					| candidates adding |
					candidates := ((b candidates at: 1) atScope: FAMIXClass) asOrderedCollection.
					candidates
						ifEmpty: [ {} ]
						ifNotEmpty: [ adding := (candidates at: 1) belongsTo.
							[ adding isNamespace ]
								whileFalse: [ candidates add: adding.
									adding := adding belongsTo ].
							self modelServices asOrderedCollection intersection: candidates ] ]) at: 1.
			Association new key: asyncClass value: to ]
]

{ #category : #accessing }
BLApplication >> linkXmlUi [
	^ self modelPhases select: [ :a | '*XMLUi' match: a superclass mooseName ] thenCollect: [ :a | Association new key: a superclass value: a ]
]

{ #category : #accessing }
BLApplication >> linkXmlUiPhaseAndPageMetier [
	^ {self modelPhases , self modelPageMetier } flatten  select: [ :a | '*XMLUi' match: a superclass mooseName ] thenCollect: [ :a | Association new key: a superclass value: a ]
]

{ #category : #accessing }
BLApplication >> model [
	^ model
]

{ #category : #accessing }
BLApplication >> model: anObject [
	model := anObject
]

{ #category : #accessing }
BLApplication >> modelAbstractTabPhase [
	^ self modelPhases
		select: [ :a | (a withSuperclassHierarchy collect: #name) anySatisfy: [ :name | 'AbstractTabPhaseController' = name ] ]
	"	thenCollect: [ :class | 
			class withSuperclassHierarchy
				collect: [ :c | 
					c outgoingInvocations
						reject: [ :invoc | invoc receiver ifNotNil: [ :el | el name = #super ] ifNil: [ false ] ]
						thenCollect: [ :invoc | class -> (invoc candidates at: 1) ] ] ]"
]

{ #category : #accessing }
BLApplication >> modelAsync [
	^ modelAsyncCache
		ifNil: [ modelAsyncCache := self model allModelClasses
		select: [ :e | e superclassHierarchy contains: [ :a | ('*AsyncCallback*' match: a name) and: [ self isEntityInBlApp: e ] ] ] ]
]

{ #category : #accessing }
BLApplication >> modelContentWidget [
		^ modelContentWidgetCache
		ifNil: [ modelContentWidgetCache := self model allModelClasses
				select: [ :e | 
					(e superclassHierarchy contains: [ :a | a name = 'IContentWidget' ])] ]
]

{ #category : #accessing }
BLApplication >> modelContentWidgetInstance [
	^ modelContentWidgetInstanceCache
		ifNil: [ modelContentWidgetInstanceCache := self getContentWidgetConstructor
		flatCollect: [ :method | 
			| got |
			got := (method queryAll: #in) atScope: FAMIXClass.
			got
				collect: [ :el | 
					| instance |
					instance := BLWidgetInstance new
						link: (Association new key: (self searchFirstNotAnonymousClassForClass: el) value: nil).
					instance widgetClass: method parentType.
					instance constructor: method.
					instance link value: instance.
					instance ] ]	]
]

{ #category : #accessing }
BLApplication >> modelPageMetier [
	^ self model allModelClasses select: [ :e | e superclassHierarchy contains: [:a | a name = 'IPageMetier']]
]

{ #category : #accessing }
BLApplication >> modelPhases [
	cacheModelPhases ifNil: [ cacheModelPhases :=  self model allClasses select: [ :e | (self phases collect: #realClassName) includes: e mooseName ]].
	^ cacheModelPhases
]

{ #category : #accessing }
BLApplication >> modelServices [
	^ cacheModelService ifNil: [ cacheModelService := self model allTypes
		select:
			[ :e | (e superclassHierarchy contains: [ :a | a name = 'RemoteService' ]) and: e isInterface ] ] 
]

{ #category : #accessing }
BLApplication >> modelWidget [
	^ modelWidgetCache ifNil: [ modelWidgetCache :=  (self model allModelClasses
		select: [ :e | (e superclassHierarchy contains: [ :a | a name = 'Widget' ] ) and: (self widgetNamespace match: e container mooseName)]) ]
]

{ #category : #accessing }
BLApplication >> modelWidgetInstance [
	"Don't use please"
	^ modelWidgetInstanceCache
		ifNil: [ modelWidgetInstanceCache := self getWidgetConstructor
				flatCollect: [ :method | 
					| got |
					got := (method queryAll: #in) atScope: FAMIXClass.
					got
						collect: [ :el | 
							| instance |
							instance := BLWidgetInstance new
								link: (Association new key: (self searchFirstNotAnonymousClassForClass: el) value: nil).
							instance widgetClass: method parentType.
							instance constructor: method.
							instance link value: instance.
							instance ] ] ]
]

{ #category : #accessing }
BLApplication >> modelWidgetInstanceFromPhaseAndPageMetier [
	^ modelWidgetInstanceFromPhaseAndPageMetierCache
		ifNil: [ modelWidgetInstanceFromPhaseAndPageMetierCache := {(self modelPageMetier , self modelPhases)} flatten
				flatCollect: [ :element | 
					| invocations |
					invocations := (element withSuperclassHierarchy flatCollect: #outgoingInvocations)
						select: [ :e | 
							| candidate |
							candidate := e candidates at: 1.
							candidate isConstructor and: [ self modelWidget includes: candidate parentType ] ].
					invocations
						collect: [ :invocation | 
							| instance |
							instance := BLWidgetInstance new.
							instance link: (Association new key: element value: instance).
							instance widgetClass: (invocation candidates at: 1) parentType.
							instance constructor: invocation ] ] ]
]

{ #category : #accessing }
BLApplication >> notUsedModelWidgetInstanceFromPhaseAndPageMetier [
	^ self modelWidget asOrderedCollection reject: [ :el | self usageOfmodelWidgetInstanceFromPhaseAndPageMetier asSet includes: el ]
]

{ #category : #accessing }
BLApplication >> phaseCanStandalone: aPhase [
	| list |
	list := OrderedCollection new.
	list
		add: 'HomePhaseController';
		add: 'AbstractSimplePhaseController';
		add: 'AbstractGeneratedPhase';
		add: 'AbstractGeneratedTabPhase'.
	^ aPhase superclassHierarchy anySatisfy: [ :a | list includes: a name ]
]

{ #category : #accessing }
BLApplication >> phases [
	^ phasesCache
		ifNil: [ | od |
			od := OrderedCollection new.
			self applicationXml
				nodesDo: [ :e | 
					e isElement
						ifTrue: [ e name localName = 'phase'
								ifTrue: [ od add: (self generatePhaseFromXmlElement: e) ] ] ].
			phasesCache := od ]
]

{ #category : #accessing }
BLApplication >> phasesLink [
	| blLink |
	blLink := ((self model allMethods
		select: [ :e | 
			e mooseName
				= 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ]) flatCollect: #incomingInvocations)
		collect: [ :e | 
			((self phases collect: #codePhase)
				includes: (e previous signature replaceAllRegex: '\(\)' with: ''))
				ifTrue:
					[ self collectAssociationFrom: e ] ]
		thenSelect: #isNotNil.
	^ blLink flatten
]

{ #category : #actions }
BLApplication >> resetCache [
	phasesCache := nil.
	cacheModelPhases := nil.
	modelWidgetInstanceCache := nil.
	linkFromConstructorCache := nil.
	modelWidgetInstanceFromPhaseAndPageMetierCache := nil.
	linkWidgetFromPPPhaseCache := nil.
	modelWidgetCache := nil.
	modelAsyncCache := nil.
	cacheModelService := nil.
	modelContentWidgetCache := nil.
	modelContentWidgetInstanceCache := nil
]

{ #category : #accessing }
BLApplication >> searchCalledPhase: e [
	^ self
		getPhaseClassFrom:
			(self
				getPhaseNamed: (e previous signature replaceAllRegex: '\(\)' with: ''))
]

{ #category : #accessing }
BLApplication >> searchCandidatesInvokingPhaseFromAssociation: e [
	| tmp |
	tmp := e sender belongsTo.
	[ tmp isAnonymousClass ] whileTrue: [ tmp := tmp belongsTo belongsTo ].
	(self modelPhases includes: tmp)
		ifTrue: [ ^ (({{tmp} asOrderedCollection . tmp subInheritances collect: [ :a | a value to ] } asOrderedCollection) select: #isNotEmpty) flatten asSet  ].
	^ tmp incomingReferences collect: [ :a | a source belongsTo ]
]

{ #category : #accessing }
BLApplication >> searchFirstNotAnonymousClassFor: e [
	| tmp |
	tmp := e sender belongsTo.
	[ tmp isAnonymousClass ] whileTrue: [ tmp := tmp belongsTo belongsTo ].
	^ tmp
]

{ #category : #accessing }
BLApplication >> searchFirstNotAnonymousClassForClass: e [
	| tmp |
	tmp := e.
	[ tmp isAnonymousClass ] whileTrue: [ tmp := tmp belongsTo belongsTo ].
	^ tmp
]

{ #category : #accessing }
BLApplication >> sourceApp [
	^ sourceApp
]

{ #category : #accessing }
BLApplication >> sourceApp: aPath [
	sourceApp := aPath
]

{ #category : #accessing }
BLApplication >> sourceCore [
	^ sourceCore
]

{ #category : #accessing }
BLApplication >> sourceCore: aPath [
	sourceCore := aPath
]

{ #category : #accessing }
BLApplication >> usageOfmodelWidgetInstanceFromPhaseAndPageMetier [
	^ (self modelWidgetInstanceFromPhaseAndPageMetier
		collect: [ :el | el link value widgetClass ]) asBag.
]

{ #category : #accessing }
BLApplication >> usageOfmodelWidgetInstanceFromPhaseAndPageMetierPerPP [
	^ (self modelWidgetInstanceFromPhaseAndPageMetier
		collect: [ :el | el link key -> el link value widgetClass ]) asBag.
]

{ #category : #accessing }
BLApplication >> viewsWidget [
	^ (self modelWidget collect: [ :widget | widget -> (self computeWidgetView: widget)])
		asDictionary
]

{ #category : #accessing }
BLApplication >> widgetNamespace [
	^ 'fr::bl::client::core::refui::*'
]
