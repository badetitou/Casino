initialization
createModelIn: aModel from: aBlApplication
	model := aModel.
	self generatePhasefrom: aBlApplication.
	self generatePageMetierfrom: aBlApplication.
	self generateXMLUifrom: aBlApplication.
	self addLinkPhaseToPageMetierFrom: aBlApplication.
	self addLinkForAbstractTabPhaseFrom: aBlApplication.
	self addLinkXmlUiFrom: aBlApplication.
	self addLinkPageMetierToPageMetier: aBlApplication.
	self generateWidgetfrom: aBlApplication.
	self generateBLActionAppelFrom: aBlApplication.
	self generateServicefrom: aBlApplication.
	self addListsToModel