accessing
widgetDefinition
	| tmpClasses |
	
	^ widgetDefinitionCache ifNil: [ widgetDefinitionCache := (self modelWidget collect: [ :widget | tmpClasses := {widget superclassHierarchyGroup. {widget}} flatten. widget -> { 
		#classes -> (tmpClasses). 
		#attributes -> (tmpClasses
		flatCollect: [ :class | class attributes collect: [ :attr | Association new key: class value: attr declaredType ] ]).
		#links -> (tmpClasses 
		flatCollect: [ :class | class superInheritances collect: [ :herit | Association new key: (self getClassFromHeritance: herit) value: class] ])} asDictionary]) asDictionary  ]