private
createModelIn: aModel
	model := aModel.
	self preImport.
	self import.
	self postImport.
	