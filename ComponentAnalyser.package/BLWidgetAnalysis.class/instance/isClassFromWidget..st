accessing
isClassFromWidget: aClass
	^ self widgetNamespace  match: aClass belongsTo mooseName
	