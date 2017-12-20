accessing
widget
	^ self model allModelClasses
		select: [ :e | 
			((e superclassHierarchyGroup collect: #name) includes: 'AbstractBLComposite')
				and: (self widgetNamespace match: e container mooseName) ]