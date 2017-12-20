initialization
createModelIn: aModel from: aBlApplication
	model := aModel.
	self generatePhasefrom: aBlApplication.
	self generatePageMetierfrom: aBlApplication.
	self generateWidgetfrom: aBlApplication.
	self addListsToModel