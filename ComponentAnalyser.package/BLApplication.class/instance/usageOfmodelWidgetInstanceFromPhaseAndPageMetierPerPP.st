accessing
usageOfmodelWidgetInstanceFromPhaseAndPageMetierPerPP
	^ (self modelWidgetInstanceFromPhaseAndPageMetier
		collect: [ :el | el link key -> el link value widgetClass ]) asBag.