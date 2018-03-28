private
widgetComposite
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*Composite' match: sup mooseName ] ]