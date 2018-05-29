accessing
modelWidget
	^ modelWidgetCache
		ifNil: [ modelWidgetCache := self sourceModel allClasses
				select: [ :e | 
					(e superclassHierarchy anySatisfy: [ :a | a name = 'Widget' ])
						and: [ (self widgetNamespace match: e container mooseName)  or: [ (self gwtWidgetNamespace match: e container mooseName )
								or: [ self isWidgetFromApplication: e ] ] ] ] ]