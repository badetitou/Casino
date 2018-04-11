running
runOn: aModel from: aBlApplication with: xml
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		xml: xml;
		basicRun;
		model