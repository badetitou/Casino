accessing
modelWidget
	^ modelWidgetCache
		ifNil: [ modelWidgetCache := self sourceModel allModelClasses
				select: [ :e | 
					(e superclassHierarchy anySatisfy: [ :a | a name = 'Widget' ])
						and: [ (self widgetNamespace match: e container mooseName)
								or: [ self isWidgetFromApplication: e ] ] ] ]