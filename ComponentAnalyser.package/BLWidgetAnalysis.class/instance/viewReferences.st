accessing
viewReferences
	| view nodes references |
	nodes := self modelWidget asSet.
	references := nodes
		flatCollect: [ :a | 
			((a queryIncoming: FAMIXInvocation) atScope: FAMIXClass)
				collect: [ :b | Association new key: a value: b ]
				thenSelect: [ :b | self modelWidget includes: b value ] ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
		height: [ :cl | cl methods size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edges useAssociations: references.
	view layout sugiyama.
	^ view