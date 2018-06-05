*BL-Model-Importer-Java
createAttributeFrom: anInvocation
	^ (BLAttribute newFrom: anInvocation for: self) ifNotNil: [ :attribute | self addAttribute: attribute. attribute  ]