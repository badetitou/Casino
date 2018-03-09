accessing
computeBestMigrationOrder2
	| view1 view2 layer |
	view1 := self viewDependancyHeritCoreAndReferencesAndDepthWithColoredLayer: 0.
	view2 := self viewReferencesWithColoredGroupForDepth: 0.
	layer := view2 build layout layout layers.
	^ ((layer at: 1) collect: #model)
		intersection:
			(((view2 view elements
				select: [ :a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ])
				collect: #model) select: [ :a | a isClass ])