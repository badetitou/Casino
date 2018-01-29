accessing
generateSmartViewFor: aClass
	| view links attributes references |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ])
		at: aClass.
	attributes := (self widgetDefinition
		collect: [ :definition | definition at: #attributes ]) at: aClass.
	links := links select: [ :a | self isAssociationInGWTAndWidget: a ].
	references := aClass queryAll: #in.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			 (self isClassFromGWT: cl)
						ifTrue: [ Color blue ]
						ifFalse: [ Color green ] ];
					width: references size.
	view
		nodes:
			{(links collect: #key).
			(links collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: {links} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view