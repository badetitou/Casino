private
widgetExtendsHtml
	^ self modelWidget select: [ :a | a superclassHierarchy contains:  [ :sup | '*::HTML' match: sup mooseName ] ]