private
linkXmlUiPhaseAndPageMetier
	^ {self modelPhases  , self modelPageMetier} flatten
		select: [ :a | '*XMLUi' match: a superclass mooseName ]
		thenCollect: [ :a | Association new key: a  value: a superclass]