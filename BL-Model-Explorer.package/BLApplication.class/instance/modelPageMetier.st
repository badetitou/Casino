accessing
modelPageMetier
	^ self model allModelClasses select: [ :e | e superclassHierarchy contains: [:a | a name = 'IPageMetier']]