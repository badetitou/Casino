accessing
isAssociationInGWTAndWidget: a
	^ (self isAssociationKeyFromGWTOrWidget: a)
		and: (self isAssociationValueFromGWTOrWidget: a)