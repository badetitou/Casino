as yet unclassified
generatePageMetier
	(sourceModel allModelClasses
		select: [ :e | (e superclassHierarchy contains: [ :a | a name = 'IPageMetier' ]) and: [ ('*XMLUi' match: e name) not ] ])
		do: [ :aPhase | self listOfPageMetier add: (self createPageMetierInModel: aPhase) ]