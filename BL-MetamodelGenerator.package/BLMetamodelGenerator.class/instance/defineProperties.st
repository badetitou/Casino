definition
defineProperties
	(entity property: #source type: #MooseEntity)
		comment: 'The source of the element (from the importation)'.
	(phase property: #codePhase type: #String)
		comment: 'The unique code of the Phase'.
	(phase property: #codeValue type: #String)
		comment: 'The short name of the codePhase'.
	(phase property: #realClassName type: #String)
		comment: 'The name of the class in Java'.
	(actionAttribute property: #codeMetierModel type: #Object)
		comment: 'The source code of the actions'.
	(widget property: 'realClass' type: #MooseEntity)
		comment: 'The type (class) of the widget'.
	(attribute property: 'attributeValue' type: #String)
		comment: 'The literal value of the attribute'.
	