accessing
classComplexityFor: aClass
	| view links attributes references |
	links := aClass superInheritances collect: [ :herit | Association new key: aClass value: (self getClassFromHeritance: herit) ].
	attributes := aClass attributes collect: [ :attr | Association new key: aClass value: attr declaredType ].
	references := aClass queryAll: #in.
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(references includes: cl)
				ifTrue: [ Color orange ]
				ifFalse: [ (self blNamespace match: cl container mooseName)
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ].
	view
		nodes:
			{(links collect: #key).
			(links collect: #value).
			references} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges
		useAssociations:
			{links.
			(references asOrderedCollection flatCollect: [ :a | {(a -> aClass)} ])} flatten.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view