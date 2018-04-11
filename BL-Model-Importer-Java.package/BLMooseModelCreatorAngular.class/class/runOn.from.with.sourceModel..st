running
runOn: aModel from: aBlApplication with: xml sourceModel: sourceModel
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model