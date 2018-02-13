accessing
viewReferencesToCoreMixMethodRelativeColorForClassMatch: aRegex
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