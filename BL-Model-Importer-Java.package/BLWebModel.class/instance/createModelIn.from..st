as yet unclassified
createModelIn: aModel from: aBlApplication
	model := aModel.
	self generatePhase.
	self generatePageMetier.
	self generateXMLUi.
	self addLinkPhaseToPageMetier.
	self addLinkForAbstractTabPhase.
	self addLinkXmlUi.
	self addLinkPageMetierToPageMetier.
	self generateWidget.
	self generateBLActionAppelFrom: aBlApplication.
	self generateService.
	self addListsToModel