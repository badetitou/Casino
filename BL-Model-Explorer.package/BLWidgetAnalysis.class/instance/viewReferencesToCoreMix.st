accessing
viewReferencesToCoreMix
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