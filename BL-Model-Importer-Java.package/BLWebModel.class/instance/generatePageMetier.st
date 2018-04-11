as yet unclassified
generatePageMetier
	(model allModelClasses select: [ :e | e superclassHierarchy contains: [:a | a name = 'IPageMetier']])  do: [ :aPhase | self listOfPageMetier add: (self createPageMetierInModel: aPhase) ]