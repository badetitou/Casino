accessing
viewReferences
	| view nodes references lb |
	nodes := self modelWidget asSet.
	references := nodes
		flatCollect:
			[ :a | ((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass) collect: [ :b | Association new key: b value: a ] thenSelect: [ :b | self modelWidget includes: b value ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
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
	lb addColor: Color blue text: 'Class from GWT'.
	lb addColor: Color green text: 'Other Class (from BlCore)'.
	lb addRectanglePolymetricWidth: '' height: 'number of methods' box: ''.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view