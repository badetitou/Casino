running
runOn: aModel fromSourceModel: sourceModel and: xml
	^ self new
		model: aModel;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model