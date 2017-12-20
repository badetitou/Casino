initialization
generateWidgetfrom: aBlApplication
	aBlApplication modelWidget
		do: [ :aPhase | self listOfWidget add: (self createWidgetInModel: aPhase) ]