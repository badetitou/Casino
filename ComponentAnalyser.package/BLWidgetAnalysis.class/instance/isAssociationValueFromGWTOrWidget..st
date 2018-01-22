accessing
isAssociationValueFromGWTOrWidget: a
	^ (self isClassFromGWT: a value) or: (self isClassFromWidget: a value)