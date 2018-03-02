accessing
isClassFromGWT: aClass
	^ self gwtNamespace match: aClass container mooseName
	