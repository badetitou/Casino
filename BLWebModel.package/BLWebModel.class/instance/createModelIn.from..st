initialization
createModelIn: aModel from: aBlApplication
	model := aModel.
	self generatePhasefrom: aBlApplication.
	self addListsToModel