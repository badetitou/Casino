private
linkXmlUiPhaseAndPageMetier
	^ {(self modelPhases  , self listOfPageMetier)} flatten
		select: [ :a | '*XMLUi' match: a superclass mooseName ]
		thenCollect: [ :a | Association new key: a superclass value: a ]