as yet unclassified
viewReferencesCoreToGWTRelativeColor
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