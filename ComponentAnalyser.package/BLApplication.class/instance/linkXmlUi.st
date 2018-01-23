accessing
linkXmlUi
	^ self modelPhases select: [ :a | '*XMLUi' match: a superclass mooseName ] thenCollect: [ :a | Association new key: a superclass value: a ]