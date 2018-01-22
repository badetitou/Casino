accessing
isAssociationFromGWT: a
	^ (self isClassFromGWT: a key) and: (self isClassFromGWT: a value)