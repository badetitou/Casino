accessing
usageOfmodelWidgetInstanceFromPhaseAndPageMetier
	^ (self modelWidgetInstanceFromPhaseAndPageMetier
		collect: [ :el | el link value widgetClass ]) asBag.