accessing
viewReferencesCoreToGWT
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