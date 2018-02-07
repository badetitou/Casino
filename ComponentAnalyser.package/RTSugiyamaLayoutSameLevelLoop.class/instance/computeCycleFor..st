private
computeCycleFor: g
	^ MalTarjan new nodes: g asOrderedCollection;
	edges: (g collect: [ :el | el connectedEdges select: [ :edge | edge from = el ] ]) flatten from: #from to: #to;
	run.