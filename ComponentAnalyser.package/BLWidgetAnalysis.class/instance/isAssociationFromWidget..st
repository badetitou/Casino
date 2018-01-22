accessing
isAssociationFromWidget: a
	^ (self isClassFromWidget: a key)
		and: (self isClassFromWidget: a value)