api
import
	self generatePhase.
	self generatePageMetier.
	self addLinkXmlUi.
	self addLinkXmlUiWidget.
	self addLinkForAbstractTabPhase.
	self addLinkPhaseToPageMetier.
	self addLinkPageMetierToPageMetier.
	self generateWidget.
	"keep this order for the widget adding. The second one depends on the first one.... Maybe i should create one method 'generate widgetlink'"
	self addLinkBetweenWidgets.
	self addPPPToWidget.
	self generateBLActionAppel.
	self generateService.
	self generateServiceAction.
	"this last two should stay at the end"
	self addWidgetAttributes.
	self addOnClickAttribute.
	self addWidgetDefaultAttributes.
	self addListsToModel.