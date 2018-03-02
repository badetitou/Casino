accessing
computeWidgetView: widget
	| view classes links attributes |
	view := RTMondrian new.
	classes := OrderedCollection new.
	classes := {widget superclassHierarchyGroup.
	{widget}} flatten.
	attributes := (classes
		flatCollect: [ :class | class attributes collect: [ :attr | Association new key: class value: attr declaredType ] ])
		asOrderedCollection.
	links := classes
		flatCollect: [ :class | class superInheritances collect: [ :herit | Association new key: class value: (self getClassFromHeritance: herit)] ].
	view shape circle
		color: [ :cl | 
			(self modelWidget includes: cl)
				ifTrue: [ Color green ]
				ifFalse: [ ((attributes collect: #value) includes: cl)
						ifTrue: [ Color red ]
						ifFalse: [ Color blue ] ] ].
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