accessing
viewReferencesAppToGWT
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