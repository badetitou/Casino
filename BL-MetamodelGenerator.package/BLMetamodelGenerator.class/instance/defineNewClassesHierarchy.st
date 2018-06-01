definition
defineNewClassesHierarchy

	entity <|-- attribute.
	entity <|-- behavior.
	entity <|-- phase.
	entity <|-- service.
	entity <|-- widget.
	widget <|-- uiContainer.
	widget <|-- uiLeaf.
	uiContainer <|-- pageMetier.
	attribute <|-- variableAttribute.
	attribute <|-- normalAttribute.
	attribute <|-- actionAttribute.
	behavior <|-- serviceAction.
	action <|-- actionAppel.
	