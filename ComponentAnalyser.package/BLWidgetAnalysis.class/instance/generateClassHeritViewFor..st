accessing
generateClassHeritViewFor: aClass
	| view links |
	links := (self widgetDefinition collect: [ :definition | definition at: #links ]) at: aClass.
	links := links select: [ :a | (self isAssociationInGWTAndWidget: a) and: a key isInterface not ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ].
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