accessing
isClassFromWidget: aClass
	^ self widgetNamespace  match: aClass container mooseName
	