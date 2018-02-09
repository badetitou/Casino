accessing
viewReferencesWithColoredGroupForDepth: aDepth
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