accessing
computeBestMigrationOrder
	| view1 view2 |
	view1 := self viewDependancyHeritCoreAndReferencesAndDepth: 0.
	view2 := self viewReferences.
	^ (((view1 view elements select: [:a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ] ) collect: #model) intersection: ((view2 view elements select: [:a | (a connectedEdges select: [ :b | b to model = a model ]) isEmpty ] ) collect: #model)) select: [ :a | a isClass ]