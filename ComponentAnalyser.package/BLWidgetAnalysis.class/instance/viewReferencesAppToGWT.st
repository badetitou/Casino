accessing
viewReferencesAppToGWT
	| view nodes references lb |
	nodes := self appTools modelPhases.
	nodes addAll: self appTools modelPageMetier.
	references := nodes
		flatCollect: [ :a | 
			((a queryOutgoing: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: a value: b ]
				thenSelect: [ :b | self isClassFromGWT: b value ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color orange ] ];
		width: [ :cl | (references select: [ :b | b value = cl ]) size ].
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
	lb
		view: view view;
		right.
	lb addText: 'Legende'.
	lb addColor: Color blue text: 'GWT'.
	lb addColor: Color orange text: 'Other Class (from BlApp)'.
	lb addLineColor: Color gray text: 'refer to'.
	lb build.
	^ view