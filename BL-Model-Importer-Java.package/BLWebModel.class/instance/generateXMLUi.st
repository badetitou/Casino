as yet unclassified
generateXMLUi
	({(self modelPhases , (self listOfPageMetier collect: #source))} flattened
		select: [ :a | '*XMLUi' match: a superclass mooseName ]
		thenCollect: [ :a | Association new key: a superclass value: a ])
		do: [ :aXmlUiClass | self listOfPageMetier add: (self createXMLUiInModel: aXmlUiClass key) ]