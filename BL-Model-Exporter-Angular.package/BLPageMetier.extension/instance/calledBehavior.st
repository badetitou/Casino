*BL-Model-Exporter-Angular
calledBehavior
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget behaviors ]) flattened asSet
		asOrderedCollection