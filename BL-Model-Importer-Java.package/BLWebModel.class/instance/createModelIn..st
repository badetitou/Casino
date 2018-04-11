as yet unclassified
createModelIn: aModel
	model := aModel.
	self generatePhase.
	self generatePageMetier.
	self addLinkPhaseToPageMetier.
	self addLinkForAbstractTabPhase.
	"
	Broken but not that usefull...
	FR -> Ceci permettait de faire les liens entre les éléments XMLUi... Mais il y a peut être plus important. En effet, ces éléments sont mal interprété pour le moment de toute façon. et on ne sait toujours pas si ce sont des phases/ des pages métier/ des choses a supprimer... 
	self addLinkXmlUi."
	self addLinkPageMetierToPageMetier.
	self generateWidget.
	self generateBLActionAppel.
	self generateService.
	self addListsToModel