accessing
viewAll
	| view links attributes |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ]) values flatten asSet.
	attributes := (self widgetDefinition collect: [ :definition | definition at: #attributes ]) values flatten
		asSet.
	links := links select: [ :a | self isAssociationInGWTAndWidget: a ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
		width: [ :cl | (cl queryAll: #out) size ];
		height: [ :cl | cl numberOfLinesOfCode * -1 ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 100;
		horizontalGap: 100.
	^ view