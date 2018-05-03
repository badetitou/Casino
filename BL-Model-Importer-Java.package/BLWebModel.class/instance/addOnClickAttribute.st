adding
addOnClickAttribute
	((self sourceModel allClasses select: [ :c | 'ClickHandler' match: c name ]) at: 1) subclassHierarchy
		select: [ :class | self isElementFromApplication: class ]
		thenCollect: [ :class |  ]