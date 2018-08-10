"
I'm a suite of tool that compute metrics and schema for Adherence analysis
"
Class {
	#name : #BLWidgetAnalysis,
	#superclass : #Object,
	#instVars : [
		'model',
		'modelWidgetCache',
		'widgetDefinitionCache',
		'appTools'
	],
	#category : 'BL-Model-Explorer'
}

{ #category : #color }
BLWidgetAnalysis >> appColor [
	^ Color orange
]

{ #category : #accessing }
BLWidgetAnalysis >> appTools [
	^ appTools
]

{ #category : #accessing }
BLWidgetAnalysis >> appTools: anObject [
	appTools := anObject
]

{ #category : #accessing }
BLWidgetAnalysis >> computeBestMigrationOrder [
	| view1 view2 |
	view1 := self viewDependancyHeritCoreAndReferencesAndDepth: 0.
	view2 := self viewReferences.
	^ (((view1 view elements select: [:a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ] ) collect: #model) intersection: ((view2 view elements select: [:a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ] ) collect: #model)) select: [ :a | a isClass ]
]

{ #category : #accessing }
BLWidgetAnalysis >> computeBestMigrationOrder2 [
	| view1 view2 layer |
	view1 := self viewDependancyHeritCoreAndReferencesAndDepthWithColoredLayer: 0.
	view2 := self viewReferencesWithColoredGroupForDepth: 0.
	layer := view2 build layout layout layers.
	^ ((layer at: 1) collect: #model)
		intersection:
			(((view2 view elements
				select: [ :a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ])
				collect: #model) select: [ :a | a isClass ])
]

{ #category : #private }
BLWidgetAnalysis >> computeColorFor: aFAMIXClass [
	(self isClassFromWidget: aFAMIXClass)
		ifTrue: [ ^ self coreColor ]
		ifFalse: [ (self isClassFromGWT: aFAMIXClass)
				ifTrue: [ ^ self gwtColor ] ].
	^ self appColor
]

{ #category : #private }
BLWidgetAnalysis >> computeColorFor: aFAMIXClass withBrightnessFrom: references [
	| color |
	color := self computeColorFor: aFAMIXClass.
	1 to:
		(references select: [ :assoc | assoc key = aFAMIXClass or: [ assoc value = aFAMIXClass ] ])
			size do: [ :i | color := color darker ].
	^ color
]

{ #category : #accessing }
BLWidgetAnalysis >> computeDepthOf: aClass in: view [
	| list depth exceptList |
	exceptList := Set new.
	depth := 0.
	list := view elements
		select: [ :a | a model = aClass  ].
	list flatCollect: [ :a | a outgoingEdges collect: #to].
	[ list isEmpty ] whileFalse: [ list := (list flatCollect: [ :a | a outgoingEdges collect: #to]) reject: [:a | exceptList includes: a]. exceptList addAll: list. depth := depth + 1 ].
	^ depth
]

{ #category : #private }
BLWidgetAnalysis >> computeLineColorFor: aFAMIXMethod withBrightnessFrom: methods [
	| color |
	color := self computeColorFor: aFAMIXMethod model.
	1 to: (methods
						select:
							[ :assoc | assoc key belongsTo = aFAMIXMethod model or: [ assoc value belongsTo = aFAMIXMethod model ] ]
						thenCollect: #key) asSet size do: [ :i | color := color darker ].
	^ color
]

{ #category : #private }
BLWidgetAnalysis >> computeLineColorsFor: el from: methods [
	^ Array
		with: (self computeLineColorFor: el from withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))
		with: (self computeLineColorFor: el to withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))
]

{ #category : #accessing }
BLWidgetAnalysis >> computeMetricFor: aClass from: data1 [
	| localResult |
	localResult := Dictionary new.
	localResult at: #genericView put: (data1 at: aClass ifAbsent: [ #notImplemented ]).
	localResult
		at: #nLoc
		put:
			(data1
				at: aClass
				ifPresent: [ :a | a view elements sum: [ :el | el model numberOfLinesOfCode ] ]).
	localResult
		at: #depth
		put:
			(data1
				at: aClass
				ifPresent: [ :a | ( self computeDepthOf: aClass in: ((data1 at: aClass) view)) ]).
	^ localResult
]

{ #category : #accessing }
BLWidgetAnalysis >> computeMetrics [
	| data data1 nbUsage results |
	data1 := self viewsWidget.
	data := (data1 collect: [ :el | el view elements collect: #model ]) values flatten.
	nbUsage := data asBag.
	results := Dictionary new.
	self modelWidget
		do: [ :aClass | 
			results at: aClass put: (self computeMetricFor: aClass from: data1).
			(results at: aClass) at: #nbUsage put: (nbUsage occurrencesOf: aClass).
			(results at: aClass) at: #smartView put: (self generateSmartViewFor: aClass).
			(results at: aClass) at: #heritView put: (self generateClassHeritViewFor: aClass).
			(results at: aClass) at: #implementsView put: (self generateClassImplementsViewFor: aClass).
			(results at: aClass) at: #nbOverriding put: (aClass methods select: #isOverriding) size ].
	^ results
]

{ #category : #private }
BLWidgetAnalysis >> computeNamespaceOf: aFamixEl [
	| tmpEl |
	tmpEl := aFamixEl.
	[ tmpEl isNamespace ] whileFalse: [ tmpEl := tmpEl belongsTo ].
	^ tmpEl 
]

{ #category : #private }
BLWidgetAnalysis >> computeRelativeColorFor: aFAMIXClass withBrightnessFrom: references [

	^ (self computeColorFor: aFAMIXClass) adjustBrightness: (references select: [ :assoc | assoc key = aFAMIXClass or: [ assoc value = aFAMIXClass ] ]) size / ({(references collect: #key) asBag sortedCounts first key.  (references collect: #value) asBag sortedCounts first key} max) * -1
]

{ #category : #private }
BLWidgetAnalysis >> computeRelativeLineColorsFor: el from: methods [
	^ Array
		with: (self computeLineColorFor: el from withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))
		with: (self computeLineColorFor: el to withBrightnessFrom: (methods select: [ :a | a key belongsTo = el from model ]))
]

{ #category : #accessing }
BLWidgetAnalysis >> computeWidgetView: widget [
	| view classes links attributes |
	view := RTMondrian new.
	classes := OrderedCollection new.
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

{ #category : #color }
BLWidgetAnalysis >> coreColor [
	^ Color green
]

{ #category : #accessing }
BLWidgetAnalysis >> extraLinkIntraLinkFromLayer [
	| layers |
	layers := (self viewReferencesWithColoredGroupForDepth: 0) build layout layout layers.
	^ layers
		collect: [ :layer | 
			| intra incomming outgoing |
			incomming := 0.
			outgoing := 0.
			intra := 0.
			(layer reject: #isDummy)
				do: [ :el | 
					el connectedEdges
						do: [ :edge | 
							(layer includes: edge from) ifTrue: [ (layer includes: edge to) ifTrue: [ intra := intra + 1 ] ifFalse: [ outgoing := outgoing + 1 ] ] ifFalse: [ incomming := incomming +1 ] ] ] .
		
			. Association new key: layer value: {#intra -> intra. #incomming -> incomming . #outgoing -> outgoing }].
]

{ #category : #private }
BLWidgetAnalysis >> findGroupOf: aClass inGroup: aCollectionOfBlWidgetGroup [
	^ (aCollectionOfBlWidgetGroup select: [ :a | a includes: aClass ]) asOrderedCollection
		at: 1
		ifAbsent: [ ^ aClass ]
]

{ #category : #accessing }
BLWidgetAnalysis >> generateClassHeritViewFor: aClass [
	| view links |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ]) at: aClass.
	links := links select: [ :a | (self isAssociationInGWTAndWidget: a) and: a key isInterface not ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> generateClassImplementsViewFor: aClass [
	| view links |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ]) at: aClass.
	links := links select: [ :a | (self isAssociationInGWTAndWidget: a) and: a key isInterface ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value).
			{aClass}} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> generateSmartViewFor: aClass [
	| view links attributes references |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ])
		at: aClass.
	attributes := (self widgetDefinition
		collect: [ :definition | definition at: #attributes ]) at: aClass.
	links := links select: [ :a | self isAssociationInGWTAndWidget: a ].
	references := aClass queryAll: #in.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			 (self isClassFromGWT: cl)
						ifTrue: [ Color blue ]
						ifFalse: [ Color green ] ];
					width: references size.
	view
		nodes:
			{(links collect: #key).
			(links collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> getClassFromHeritance: herit [
	herit value to isParameterizedType
		ifTrue: [ ^ herit value to parameterizableClass ].
	^ herit value to
]

{ #category : #accessing }
BLWidgetAnalysis >> groupAtLayer [
	^ self groupAtLayerWithDepth: 0
]

{ #category : #accessing }
BLWidgetAnalysis >> groupAtLayerWithDepth: aDepth [
	| group view1 layer |
	group := self groupWithDepth: aDepth.
	view1 := self viewReferencesWithColoredGroupForDepth: 0.
	layer := view1 build layout layout layers
		collect: [ :od | od reject: #isDummy thenCollect: #model ].
	^ group
		collect: [ :g | 
			layer
				collect: [ :l | 
					(l asOrderedCollection includesAll: g asOrderedCollection)
						ifTrue: [ Association new key: l value: g ]
						ifFalse: [ nil ] ]
				thenSelect: #isNotNil ] thenSelect: #isNotEmpty
]

{ #category : #accessing }
BLWidgetAnalysis >> groupWithDepth: aDepth [
	| view result |
	view := self viewDependancyHeritCoreAndReferencesAndDepth: aDepth.
	result := Dictionary new.
	(view view elements select: [:a | a model isClass])
		do: [ :anElement | 
			| topElement |
			topElement := self searchTopElementFor: anElement.
			result
				at: topElement
				ifPresent: [ :a | a add: anElement model ]
				ifAbsentPut: [ | od |
					od := BLWidgetGroup new.
					od add: anElement model.
					od ] ].
	^ result
]

{ #category : #color }
BLWidgetAnalysis >> gwtColor [
	^ Color blue
]

{ #category : #accessing }
BLWidgetAnalysis >> gwtNamespace [
	^ 'com::google::gwt::*'
]

{ #category : #accessing }
BLWidgetAnalysis >> isAssociationFromGWT: a [
	^ (self isClassFromGWT: a key) and: (self isClassFromGWT: a value)
]

{ #category : #accessing }
BLWidgetAnalysis >> isAssociationFromWidget: a [
	^ (self isClassFromWidget: a key) and: (self isClassFromWidget: a value).
]

{ #category : #accessing }
BLWidgetAnalysis >> isAssociationInGWTAndWidget: a [
	^ (self isAssociationKeyFromGWTOrWidget: a)
		and: (self isAssociationValueFromGWTOrWidget: a)
]

{ #category : #accessing }
BLWidgetAnalysis >> isAssociationKeyFromGWTOrWidget: a [
	^ (self isClassFromGWT: a key) or: (self isClassFromWidget: a key)
]

{ #category : #accessing }
BLWidgetAnalysis >> isAssociationValueFromGWTOrWidget: a [
	^ (self isClassFromGWT: a value) or: (self isClassFromWidget: a value)
]

{ #category : #accessing }
BLWidgetAnalysis >> isClassFromGWT: aClass [
	^ self gwtNamespace match: aClass container mooseName
	
]

{ #category : #accessing }
BLWidgetAnalysis >> isClassFromWidget: aClass [
	^ self widgetNamespace  match: aClass belongsTo mooseName
	
]

{ #category : #accessing }
BLWidgetAnalysis >> model [
	^ model
]

{ #category : #accessing }
BLWidgetAnalysis >> model: aMooseModel [
	model := aMooseModel 
]

{ #category : #accessing }
BLWidgetAnalysis >> modelWidget [
	^ modelWidgetCache ifNil: [ modelWidgetCache :=  (self model allModelClasses
		select: [ :e | (e superclassHierarchy contains: [ :a | a name = 'Widget' ] ) and: (self widgetNamespace match: e container mooseName)]) ]
]

{ #category : #glamour }
BLWidgetAnalysis >> openGlamour [
	^ GLMCompositePresentation new tabulator
		with: [ :t | 
			t column: #index; column: #details.
			t transmit
				to: #index;
				andShow: [ :composite | 
					composite list
						title: 'Widgets';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #details;
				andShow: [ :composite | 
					composite roassal2
						title: 'Adherence App-Core';
						initializeView: [ RTMondrian new ];
						painting: [ :view :class | self viewReferencesToCoreMixMethodForClassMatch: '*' , class name , '*' toGl: view ].
					composite roassal2
						title: 'Adherence Core-GWT';
						initializeView: [ RTMondrian new ];
						painting: [ :view :class | self viewReferencesCoreToGWTRelativeColorForClassMatch: '*' , class name , '*' toGl: view ] ] ];
		title: 'Widget Adherences';
		openOn: self modelWidget
]

{ #category : #resetting }
BLWidgetAnalysis >> resetCache [
	widgetDefinitionCache := nil.
	modelWidgetCache := nil.
]

{ #category : #accessing }
BLWidgetAnalysis >> searchTopElementFor: anElement [
	| edges result |
	edges := anElement connectedEdges ifEmpty: [ ^anElement model ].
	result := Set new.
	result := edges select: [ :a | a to = anElement ] thenCollect: [:a | a from ].
	[edges isNotEmpty ] whileTrue: [ result := edges collect: #from. edges := (result flatCollect: #connectedEdges) select: [ :a | result includes: a to ] ].
	^ (result at: 1) model
]

{ #category : #private }
BLWidgetAnalysis >> usageOfAllWidget [
 | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | (((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ]) atScope: FAMIXClass) collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | (self isClassFromGWT: b value ) or: [ self isClassFromWidget: b value ] ] ].
	^ (references collect: #value) asBag 
]

{ #category : #private }
BLWidgetAnalysis >> usageOfAllWidgetPP [
   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | (((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ]) atScope: FAMIXClass) collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | (self isClassFromGWT: b value) or: [ self isClassFromWidget: b value ] ] ].
	^ references asBag 

]

{ #category : #private }
BLWidgetAnalysis >> usageOfAllWidgetWithCode [

   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | ((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ])  collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | (self isClassFromGWT: (b value to at: 1) belongsTo) or: [ self isClassFromWidget: (b value to at: 1) belongsTo ] ] ].
	^ (references collect: #value) asBag 
]

{ #category : #private }
BLWidgetAnalysis >> usageOfGWTWidget [
   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | (((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ])atScope: FAMIXClass)  collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | self isClassFromGWT: b value ] ].
	^ (references collect: #value) asBag 
]

{ #category : #private }
BLWidgetAnalysis >> usageOfGWTWidgetPP [
   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | (((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ]) atScope: FAMIXClass) collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | self isClassFromGWT: b value ] ].
	^ references asBag 
]

{ #category : #private }
BLWidgetAnalysis >> usageOfGWTWidgetWithCode [
   | nodes references |
	nodes := self appTools modelPhases copy.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | ((a queryOutgoing: FAMIXInvocation) select: [:el | (el candidates at: 1) isConstructor ])  collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | self isClassFromGWT: (b value to at: 1) belongsTo ] ].
	^ (references collect: #value) asBag 
]

{ #category : #accessing }
BLWidgetAnalysis >> viewAll [
	| view links attributes |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ]) values flatten asSet.
	attributes := (self widgetDefinition collect: [ :definition | definition at: #attributes ]) values flatten
		asSet.
	links := links select: [ :a | self isAssociationInGWTAndWidget: a ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
		width: [ :cl | (cl queryAll: #out) size ];
		height: [ :cl | cl numberOfLinesOfCode * -1 ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 100;
		horizontalGap: 100.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewDependancyHeritCore [
	^ self viewDependancyHeritCoreAndDepth: 0
]

{ #category : #accessing }
BLWidgetAnalysis >> viewDependancyHeritCoreAndDepth: theDepth [
	| view nodes |
	nodes := self modelWidget asSet.
	1 to: theDepth do: [ :val | nodes addAll: (nodes collect: #superclass thenSelect: #isNotNil) ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
		height: [ :cl | cl methods size ];
		width: [ :cl | (cl methods select: #isOverriding) size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edgesFrom: #superclass.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewDependancyHeritCoreAndReferencesAndDepth: theDepth [
	| view nodes references lb |
	nodes := self modelWidget asSet.
	1 to: theDepth do: [ :val | nodes addAll: (nodes collect: #superclass thenSelect: #isNotNil) ].
	nodes := nodes select: [ :el | (self isClassFromGWT: el) or: (self isClassFromWidget: el) ].
	references := (nodes
		collect: [ :a | 
			a
				->
					(((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
						collect: [ :b | Association new key: b value: a ]
						thenSelect: [ :b | self modelWidget includes: b value ]) ]) asDictionary.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			self computeColorFor: cl	];
		height: [ :cl | cl methods size ];
		width: [ :cl | (references at: cl) size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edgesFrom: #superclass.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'Legende'.
	lb addColor: self gwtColor text: 'Class from GWT'.
	lb addColor: self coreColor  text: 'Other Class (from BlCore)'.
	lb addRectanglePolymetricWidth: 'number of references' height: 'number of methods' box: 'aWidget'.
	lb addLineColor: Color gray text: 'superclass'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewDependancyHeritCoreAndReferencesAndDepthWithColoredLayer: theDepth [
	| view nodes references lb layer n |
	layer := ((self viewReferencesWithColoredGroupForDepth: theDepth) build layout layout layerNrs reverse) collect: [:col | col reject: #isDummy thenCollect: #model].
	n := RTMultiLinearColorForIdentity new objects: layer asOrderedCollection.
	nodes := self modelWidget asSet.
	1 to: theDepth do: [ :val | nodes addAll: (nodes collect: #superclass thenSelect: #isNotNil) ].
	nodes := nodes select: [ :el | (self isClassFromGWT: el) or: (self isClassFromWidget: el) ].
	references := (nodes
		collect: [ :a | a -> (((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: b value: a ] thenSelect: [ :b | self modelWidget includes: b value ]) ]) asDictionary.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [n rtValue: (self findGroupOf: cl inGroup: layer asOrderedCollection) ] ];
		height: [ :cl | cl methods size ];
		width: [ :cl | (references at: cl) size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edgesFrom: #superclass.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'Legende'.
	lb addColor: Color blue text: 'Class from GWT'.
	lb addColorFadingUsing: n colors text: 'Layer level'.
	lb addRectanglePolymetricWidth: 'number of references' height: 'number of methods' box: 'aWidget'.
	lb addLineColor: Color gray text: 'superclass'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewGroupReferencesForDepth: aDepth [
	| view nodes references lb |
	nodes := self groupWithDepth: aDepth.
	references := nodes collect: [ :a | ((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: (self findGroupOf: b inGroup: nodes) value: a ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | Color red].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references values flatten.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'References between group of widget'.
	lb addColor: Color red text: 'A Group of Widget'.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferences [
	| view nodes references lb |
	nodes := self modelWidget asSet.
	references := nodes
		flatCollect:
			[ :a | ((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: b value: a ] thenSelect: [ :b | self modelWidget includes: b value ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			self computeColorFor: cl ];
		height: [ :cl | cl methods size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor: self gwtColor  text: 'Class from GWT'.
	lb addColor: self coreColor text: 'Other Class (from BlCore)'.
	lb addRectanglePolymetricWidth: '' height: 'number of methods' box: ''.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesAppToGWT [
	| view nodes references lb |
	nodes := self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	references := nodes flatCollect: [ :a | ((a queryOutgoing: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: a value: b ] thenSelect: [ :b | self isClassFromGWT: b value ] ] .
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color orange ] ];
		height: [ :cl | (self isClassFromGWT: cl) ifTrue: [(references select: [ :b | b value = cl ]) size ] ifFalse: [ (references select: [ :b | b key = cl and: [ self isClassFromGWT: b value ] ]) size] ].
	"view nodes: nodes asSet."
	view
		nodes:
			{(references collect: #key).
			(references collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'From BlApp to GWT'.
	lb addColor: Color blue text: 'GWT'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addLineColor: Color gray text: 'refer to'.
	lb addRectanglePolymetricWidth: '' height: 'number of references (#in GWT, #out BlApp)' box: ''.
	lb build.
	^ view 
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesCoreToGWT [
	| view nodes references lb |
	nodes := self modelWidget copy.
	references := nodes
		flatCollect: [ :a | 
			((a queryOutgoing: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: a value: b ]
				thenSelect: [ :b | self isClassFromGWT: b value ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeColorFor: cl ];
		height: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ (references select: [ :b | b value = cl ]) size ]
				ifFalse: [ (references select: [ :b | b key = cl and: [ self isClassFromGWT: b value ] ]) size ] ].
	"view nodes: nodes asSet."
	view
		nodes:
			{(references collect: #key).
			(references collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'From BlApp to GWT'.
	lb addColor: self gwtColor text: 'GWT'.
	lb addColor: self coreColor text: 'Other Class (from BlApp)'.
	lb addLineColor: Color gray text: 'refer to'.
	lb addRectanglePolymetricWidth: '' height: 'number of references (#in GWT, #out BlApp)' box: ''.
	lb build.
	^ view
]

{ #category : #'as yet unclassified' }
BLWidgetAnalysis >> viewReferencesCoreToGWTRelativeColor [
	| view nodes references lb methods |
	nodes := self modelWidget copy.
	methods := (nodes asOrderedCollection
		flatCollect: [ :a | (a queryOutgoing: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		select: [ :b | self isClassFromGWT: b value belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeRelativeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ (references select: [ :b | b value = cl ]) size ]
				ifFalse: [ (references select: [ :b | b key = cl and: [ self isClassFromGWT: b value ] ]) size ] ].
	"view nodes: nodes asSet."
	view
		nodes:
			{(references collect: #key).
			(references collect: #value)} flatten asSet.
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeRelativeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: references.
	view layout sugiyama
		horizontalGap: 100;
		verticalGap: 500.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'From BLCore to GWT'.
	lb addColor: self gwtColor text: 'GWT'.
	lb addColor: self coreColor text: 'BLcore'.
	lb addLineColor: Color gray text: 'refer to'.
	lb addRectanglePolymetricWidth: 'number of references (#in GWT, #out BlApp)' height: '' box: ''.
	lb build.
	^ view
]

{ #category : #'as yet unclassified' }
BLWidgetAnalysis >> viewReferencesCoreToGWTRelativeColorForClassMatch: aRegex [
	| view nodes references lb methods |
	nodes := self modelWidget copy select: [ :el | aRegex match: el name ]..
	methods := (nodes asOrderedCollection
		flatCollect: [ :a | (a queryOutgoing: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		select: [ :b | self isClassFromGWT: b value belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeRelativeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ (references select: [ :b | b value = cl ]) size ]
				ifFalse: [ (references select: [ :b | b key = cl and: [ self isClassFromGWT: b value ] ]) size ] ].
	"view nodes: nodes asSet."
	view
		nodes:
			{(references collect: #key).
			(references collect: #value)} flatten asSet.
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeRelativeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: references.
	view layout sugiyama
		horizontalGap: 100;
		verticalGap: 500.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'From BLCore to GWT'.
	lb addColor: self gwtColor text: 'GWT'.
	lb addColor: self coreColor text: 'BLcore'.
	lb addLineColor: Color gray text: 'refer to'.
	lb addRectanglePolymetricWidth: 'number of references (#in GWT, #out BlApp)' height: '' box: ''.
	lb build.
	^ view
]

{ #category : #glamour }
BLWidgetAnalysis >> viewReferencesCoreToGWTRelativeColorForClassMatch: aRegex toGl: aRTMondrian [
	| view nodes references lb methods |
	nodes := self modelWidget copy select: [ :el | aRegex match: el name ].
	methods := (nodes asOrderedCollection
		flatCollect: [ :a | (a queryOutgoing: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		select: [ :b | self isClassFromGWT: b value belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	view := aRTMondrian.
	view shape rectangle
		color: [ :cl | self computeRelativeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ (references select: [ :b | b value = cl ]) size ]
				ifFalse: [ (references select: [ :b | b key = cl and: [ self isClassFromGWT: b value ] ]) size ] ].
	"view nodes: nodes asSet."
	view
		nodes:
			{(references collect: #key).
			(references collect: #value)} flatten asSet.
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeRelativeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: references.
	view layout sugiyama
		horizontalGap: 100;
		verticalGap: 500.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'From BLCore to GWT'.
	lb addColor: self gwtColor text: 'GWT'.
	lb addColor: self coreColor text: 'BLcore'.
	lb addLineColor: Color gray text: 'refer to'.
	lb addRectanglePolymetricWidth: 'number of references (#in GWT, #out BlApp)' height: '' box: ''.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToCoreMix [
	| view nodes references lb tmpNode |
	nodes := self modelWidget copy.
	references := nodes asOrderedCollection
		flatCollect:
			[ :a | ((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: b value: a ] thenReject: [ :b | self modelWidget includes: b key ] ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			cl isNamespace
				ifTrue: [ Color gray ]
				ifFalse: [ (self isClassFromWidget: cl)
						ifTrue: [ Color lightGreen ]
						ifFalse: [ Color lightOrange ] ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ].
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ].
	view edges useAssociations: tmpNode.
	view edgesFrom: #subInheritances.
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColor: Color green text: 'Widget'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ''.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToCoreMixMethod [
	| view nodes references lb tmpNode methods |
	nodes := self modelWidget copy.
	methods := (nodes asOrderedCollection flatCollect: [ :a | (a queryIncoming: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		reject: [ :b | self modelWidget includes: b key belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := (references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ]) asSet.
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	"(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8."
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: tmpNode.
	"view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ]."
	"	view edgesFrom: #subInheritances."
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColorFadingFrom: self coreColor to: Color black text: 'Widget from "simple" to "Max references" (compare to the others nodes)'.
	lb addColorFadingFrom: self appColor to: Color black text: 'AppClass from "simple" to "Max references" (compare to the others nodes)'.
	lb addLineColorFadingFrom: Color white to: Color black text: 'Number of method imply in an edge compare to the Number of method in all references of the node'.	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ' '.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToCoreMixMethodForClassMatch: aRegex [
	| view nodes references lb tmpNode methods |
	nodes := self modelWidget copy select: [ :el | aRegex match: el name ].
	methods := (nodes asOrderedCollection
		flatCollect:
			[ :a | (a queryIncoming: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		reject: [ :b | self modelWidget includes: b key belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := (references
		select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ]) asSet.
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	"(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8."
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width:
						[ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: tmpNode.
	"view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ]."
	"	view edgesFrom: #subInheritances."
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColorFadingFrom: self coreColor to: Color black text: 'Widget from "simple" to "Max references" (compare to the others nodes)'.
	lb addColorFadingFrom: self appColor to: Color black text: 'AppClass from "simple" to "Max references" (compare to the others nodes)'.
	lb addLineColorFadingFrom: Color white to: Color black text: 'Number of method imply in an edge compare to the Number of method in all references of the node'.	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ' '.
	lb build.
	^ view
]

{ #category : #glamour }
BLWidgetAnalysis >> viewReferencesToCoreMixMethodForClassMatch: aRegex toGl: aGlamourMondrianView [
	| view nodes references lb tmpNode methods |
	nodes := self modelWidget copy select: [ :el | aRegex match: el name ].
	methods := (nodes asOrderedCollection flatCollect: [ :a | (a queryIncoming: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		reject: [ :b | self modelWidget includes: b key belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := aGlamourMondrianView.
	view shape rectangle
		color: [ :cl | self computeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := (references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ]) asSet.
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	"(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8."
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: tmpNode.
	"view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ]."
	"	view edgesFrom: #subInheritances."
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColorFadingFrom: self coreColor to: Color black text: 'Widget from "simple" to "Max references" (compare to the others nodes)'.
	lb addColorFadingFrom: self appColor to: Color black text: 'AppClass from "simple" to "Max references" (compare to the others nodes)'.
	lb addLineColorFadingFrom: Color white to: Color black text: 'Number of method imply in an edge compare to the Number of method in all references of the node'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ' '.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToCoreMixMethodRelativeColor [
	| view nodes references lb tmpNode methods |
	nodes := self modelWidget copy.
	methods := (nodes asOrderedCollection flatCollect: [ :a | (a queryIncoming: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		reject: [ :b | self modelWidget includes: b key belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeRelativeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := (references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ]) asSet.
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	"(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8."
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeRelativeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: tmpNode.
	"view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ]."
	"	view edgesFrom: #subInheritances."
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColorFadingFrom: self coreColor to: Color black text: 'Widget from "simple" to "Max references" (compare to the others nodes)'.
	lb addColorFadingFrom: self appColor to: Color black text: 'AppClass from "simple" to "Max references" (compare to the others nodes)'.
	lb addLineColorFadingFrom: Color white to: Color black text: 'Number of method imply in an edge compare to the Number of method in all references of the node'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ' '.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToCoreMixMethodRelativeColorForClassMatch: aRegex [
	| view nodes references lb tmpNode methods |
	nodes := self modelWidget copy select: [ :el | aRegex match: el name ].
	methods := (nodes asOrderedCollection
		flatCollect: [ :a | (a queryIncoming: FAMIXInvocation) collect: [ :invoc | invoc from -> (invoc to at: 1) ] ])
		reject: [ :b | self modelWidget includes: b key belongsTo ].
	references := methods collect: [ :assoc | assoc key belongsTo -> assoc value belongsTo ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | self computeRelativeColorFor: cl withBrightnessFrom: references ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	tmpNode := (references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ]) asSet.
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	"(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8."
	view
		shape:
			(RTParametrableGradientColoredLine new
				colorsForBlock: [ :el | self computeRelativeLineColorsFor: el from: methods ];
				precision: 1;
				withBorderAttachPoint;
				width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ];
				gradientColorShape).
	view edges useAssociations: tmpNode.
	"view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ]."
	"	view edgesFrom: #subInheritances."
	view layout sugiyama
		verticalGap: 500;
		horizontalGap: 200.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColorFadingFrom: self coreColor to: Color black text: 'Widget from "simple" to "Max references" (compare to the others nodes)'.
	lb addColorFadingFrom: self appColor to: Color black text: 'AppClass from "simple" to "Max references" (compare to the others nodes)'.
	lb
		addLineColorFadingFrom: Color white
		to: Color black
		text: 'Number of method imply in an edge compare to the Number of method in all references of the node'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ' '.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToLeaf [
	| view nodes references lb tmpNode |
	nodes := self modelWidget asSet
		reject: [ :class | class subInheritances isNotEmpty and: [ class isClass ] ].
	references := nodes asOrderedCollection
		flatCollect: [ :a | 
			((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: b value: a ]
				thenReject: [ :b | self modelWidget includes: b key ] ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromWidget: cl)
				ifTrue: [ Color green ]
				ifFalse: [ Color orange ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) asSet size ].
	tmpNode := references
		select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ].
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view shape line width: [ :asso | (references select: [ :a | a key = asso key and: [ a value = asso value ] ]) size ].
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColor: Color green text: 'Widget'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ''.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToNoLeaf [
	| view nodes references lb tmpNode |
	nodes := self modelWidget asSet select: [ :class | class subInheritances isNotEmpty and: [ class isClass ] ].
	references := nodes
		flatCollect: [ :a | 
			((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: b value: a ]
				thenReject: [ :b | self modelWidget includes: b key ] ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromWidget: cl)
				ifTrue: [ Color green ]
				ifFalse: [ Color orange ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	"view nodes: nodes asSet."
	tmpNode := references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ].
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb
		view: view view.
	lb addText: 'BlAPP -> WidgetLeaf'.
	lb addColor: Color green text: 'Widget'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addRectanglePolymetricWidth: 'number of references' height: '' box: ''.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesToWidgetInterface [
	| view nodes references lb tmpNode |
	nodes := self modelWidget asSet
		select: [ :class |  class isInterface ] .
	references := nodes
		flatCollect: [ :a | 
			((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: b value: a ]
				thenReject: [ :b | self modelWidget includes: b key ] ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromWidget: cl)
				ifTrue: [ Color green ]
				ifFalse: [ Color orange ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	"view nodes: nodes asSet."
	tmpNode := references
		select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ].
	view
		nodes:
			{(tmpNode collect: #key).
			(tmpNode collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	lb := RTLegendBuilder new.
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor: Color green text: 'Widget'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewReferencesWithColoredGroupForDepth: aDepth [
	| view nodes references lb group n |
	group := self groupWithDepth: aDepth.
	nodes := self modelWidget asSet.
	references := nodes
		flatCollect: [ :a | 
			((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: b value: a ]
				thenSelect: [ :b | self modelWidget includes: b value ] ].
	view := RTMondrian new.
	n := RTMultiLinearColorForIdentity new objects: group asOrderedCollection.
	view shape rectangle
		color: [ :cl | n rtValue: (self findGroupOf: cl inGroup: group) ];
		height: [ :cl | cl methods size ];
		width: [ :cl | 
			(((cl queryOutgoing: FAMIXInvocation) atScope: FAMIXClass)
				select: [ :clOutgoing | self isClassFromGWT: clOutgoing ]) size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape
		head;
		color: [ :line | 
			(self findGroupOf: line key inGroup: group)
				= (self findGroupOf: line value inGroup: group)
				ifTrue: [ Color gray ]
				ifFalse: [ Color red ] ].
	view edges useAssociations: references.
	view layout sugiyamaSameLevelLoop.
	lb := RTLegendBuilder new.
	lb view: view view.
	lb addText: 'References between BlCore (widget) With colored group'.
	lb addColorFadingUsing: n colors text: 'Group'.
	lb
		addRectanglePolymetricWidth: 'References from GWT'
		height: 'number of methods'
		box: 'aWidget'.
	lb addLineColor: Color red text: 'Inter Group'.
	lb addLineColor: Color gray text: 'Intra Group'.
	lb build.
	^ view
]

{ #category : #accessing }
BLWidgetAnalysis >> viewsWidget [
	^ (self modelWidget collect: [ :widget | widget -> (self computeWidgetView: widget)])
		asDictionary
]

{ #category : #private }
BLWidgetAnalysis >> widgetComposite [
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*Composite' match: sup mooseName ] ]
]

{ #category : #accessing }
BLWidgetAnalysis >> widgetDefinition [
	| tmpClasses |
	
	^ widgetDefinitionCache ifNil: [ widgetDefinitionCache := (self modelWidget collect: [ :widget | tmpClasses := {widget superclassHierarchyGroup. {widget}} flatten. widget -> { 
		#classes -> (tmpClasses). 
		#attributes -> (tmpClasses
		flatCollect: [ :class | class attributes collect: [ :attr | Association new key: class value: attr declaredType ] ]).
		#links -> (tmpClasses 
		flatCollect: [ :class | class superInheritances collect: [ :herit | Association new key: (self getClassFromHeritance: herit) value: class] ])} asDictionary]) asDictionary  ]
]

{ #category : #private }
BLWidgetAnalysis >> widgetExtendsHtml [
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*::HTML' match: sup mooseName ] ]
]

{ #category : #private }
BLWidgetAnalysis >> widgetIsExportable [
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*::isExportable' match: sup mooseName ] ]
]

{ #category : #accessing }
BLWidgetAnalysis >> widgetNamespace [
	^ 'fr::bl::client::core::refui::*'
]
