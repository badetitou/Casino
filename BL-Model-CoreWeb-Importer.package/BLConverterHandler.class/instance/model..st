accessing
model: aModel
	model := aModel.
	self next ifNotNil: [ self next model: aModel ]