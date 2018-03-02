accessing
viewGroupReferencesForDepth: aDepth
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