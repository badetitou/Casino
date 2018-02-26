accessing
usageOfmodelWidgetInstanceFromPhaseAndPageMetierPerPP
	^ (self modelWidgetInstanceFromPhaseAndPageMetier
		collect: [ :el | el link value widgetClass -> el link key ]) asBag.