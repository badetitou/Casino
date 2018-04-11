as yet unclassified
createModelIn: aModel
	model := aModel.
	self generatePhase.
	self generatePageMetier.
	self addLinkPhaseToPageMetier.
	self addLinkForAbstractTabPhase.
	"self addLinkXmlUi."
	self addLinkPageMetierToPageMetier.
	self generateWidget.
	"self generateBLActionAppel.
	self generateService."
	self addListsToModel