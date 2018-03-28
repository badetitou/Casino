private
widgetIsExportable
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*::isExportable' match: sup mooseName ] ]