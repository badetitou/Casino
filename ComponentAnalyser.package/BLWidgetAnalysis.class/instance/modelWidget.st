accessing
modelWidget
	^ modelWidgetCache ifNil: [ modelWidgetCache :=  (self model allModelClasses
		select: [ :e | (e superclassHierarchy contains: [ :a | a name = 'Widget' ] ) and: (self widgetNamespace match: e container mooseName)]) ]