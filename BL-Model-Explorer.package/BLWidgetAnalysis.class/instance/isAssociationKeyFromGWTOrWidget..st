accessing
isAssociationKeyFromGWTOrWidget: a
	^ (self isClassFromGWT: a key) or: (self isClassFromWidget: a key)