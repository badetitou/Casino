accessing
computeDepthOf: aClass in: view
	| list depth exceptList |
	exceptList := Set new.
	depth := 0.
	list := view elements
		select: [ :a | a model = aClass  ].
	list flatCollect: [ :a | a outgoingEdges collect: #to].
	[ list isEmpty ] whileFalse: [ list := (list flatCollect: [ :a | a outgoingEdges collect: #to]) reject: [:a | exceptList includes: a]. exceptList addAll: list. depth := depth + 1 ].
	^ depth