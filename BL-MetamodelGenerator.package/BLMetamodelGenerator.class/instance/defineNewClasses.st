definition
defineNewClasses
	
	action := builder newClassNamed: #Action.
	actionAppel := builder newClassNamed: #ActionAppel.
	entity := builder newClassNamed: #OriginedEntity.
	attribute := builder newClassNamed: #Attribute.
	actionAttribute := builder newClassNamed: #ActionAttribute.
	normalAttribute := builder newClassNamed: #NormalAttribute.
	variableAttribute := builder newClassNamed: #VariableAttribute.
	behavior := builder newClassNamed: #Behavior.
	serviceAction := builder newClassNamed: #ServiceAction.
	phase := builder newClassNamed: #Phase.
	service := builder newClassNamed: #Service.
	widget := builder newClassNamed: #Widget.
	uiContainer := builder newClassNamed: #UIContainer.
	pageMetier := builder newClassNamed: #PageMetier.
	uiLeaf := builder newClassNamed: #UILeaf.
	entity --|> #TNamed.
	entity --|> #TWithSourceAnchor.
	
	