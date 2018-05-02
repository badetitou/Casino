as yet unclassified
createModelIn: aModel
	model := aModel.
	self generatePhase.
	self generatePageMetier.
	self addLinkXmlUi.
	self addLinkForAbstractTabPhase.
	self addLinkPhaseToPageMetier.
	self addLinkPageMetierToPageMetier.
	self generateWidget.
	"keep this order for the widget adding. The second one depends on the first one.... Maybe i should create one method 'generate widgetlink'"
	self addLinkBetweenWidgets.
	self addPPPToWidget.
	self addWidgetAttributes. self generateBLActionAppel.
	self generateService.
	self addListsToModel