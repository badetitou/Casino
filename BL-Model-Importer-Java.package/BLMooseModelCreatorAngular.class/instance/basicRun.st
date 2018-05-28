accessing
basicRun
	self modelKind new
		xml: (PPXmlParser parse: xml asFileReference contents);
		sourceModel: sourceModel;
		createModelIn: model.
	model install