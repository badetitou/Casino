accessing
phaseCanStandalone: aPhase
	| list |
	list := OrderedCollection new.
	list
		add: 'HomePhaseController';
		add: 'AbstractSimplePhaseController';
		add: 'AbstractGeneratedPhase';
		add: 'AbstractGeneratedTabPhase'.
	^ aPhase superclassHierarchy anySatisfy: [ :a | list includes: a name ]