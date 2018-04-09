initialization
generateWidgetfrom: aBlApplication
	aBlApplication modelWidgetInstanceFromPhaseAndPageMetier
		do: [ :aWidgetInstance | self listOfWidget add: (self createWidgetInModel: aWidgetInstance ) ]