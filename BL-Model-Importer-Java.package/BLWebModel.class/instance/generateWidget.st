as yet unclassified
generateWidget
	self widgetInstanceFromPhaseAndPageMetier
		do: [ :aWidgetInstance | self listOfWidget add: (self createWidgetInModel: aWidgetInstance) ]