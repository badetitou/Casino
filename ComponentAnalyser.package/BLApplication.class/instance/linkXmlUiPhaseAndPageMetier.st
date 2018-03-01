accessing
linkXmlUiPhaseAndPageMetier
	^ {self modelPhases , self modelPageMetier } flatten  select: [ :a | '*XMLUi' match: a superclass mooseName ] thenCollect: [ :a | Association new key: a superclass value: a ]