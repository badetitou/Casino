running
runOn: aModel from: aBlApplication
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		basicRun;
		model