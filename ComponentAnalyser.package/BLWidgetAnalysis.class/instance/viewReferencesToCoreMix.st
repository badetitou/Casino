accessing
viewReferencesToCoreMix
	| view nodes references lb tmpNode namespaces |
	namespaces := (self modelWidget collect: [ :el | self computeNamespaceOf: el ]) asSet.
	nodes := self modelWidget copy.
	references := nodes
		flatCollect: [ :a | ((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: b value: a ] thenReject: [ :b | self modelWidget includes: b key ] ].
	nodes addAll: self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			cl isNamespace
				ifTrue: [ Color gray ]
				ifFalse: [ (self isClassFromWidget: cl)
						ifTrue: [ Color green ]
						ifFalse: [ Color orange ] ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
	"view nodes: nodes asSet."
	tmpNode := references select: [ :a | (nodes includes: a key) and: [ nodes includes: a value ] ].
	view nodes: (tmpNode collect: #key).
	view
		nodes: namespaces
		forEach: [ :el | 
			el isNamespace
				ifTrue: [ view shape rectangle
						color: [ :cl | 
							cl subInheritances isEmpty
								ifTrue: [ Color green ]
								ifFalse: [ Color green muchDarker ] ];
						width: [ :cl | cl numberOfAttributes ];
						height: #numberOfMethods.
					view nodes: el classes.
					view edgesFrom: #superclass.
					view treeLayout ] ].
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		color: Color white;
		size: 8.
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