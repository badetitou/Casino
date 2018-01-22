accessing
viewAll
	| view links attributes |
	links := (self widgetDefinition
		collect: [ :definition | definition at: #links ]) values flatten
		asSet.
	attributes := (self widgetDefinition
		collect: [ :definition | definition at: #attributes ]) values
		flatten asSet.
	links := links select:
		[ :a | self isAssociationInGWTAndWidget: a ].
	attributes := attributes
		select:
			[ :a | self isAssociationInGWTAndWidget: a ].
	view := RTMondrian new.
	view shape circle color: [ :cl | (self isClassFromGWT: cl) ifTrue: [Color blue] ifFalse: [ Color red ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value).
			(attributes collect: #key).
			(attributes collect: #value)} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges
		useAssociations:
			{links.
			attributes} flatten.
	view treeLayout.
	^ view