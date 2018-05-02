accessing
createAttributeFrom: anInvocation
	(BLAttribute newFrom: anInvocation for: self) ifNotNil: [ :attribute | self addAttribute: attribute ]