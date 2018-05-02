testing
canHaveAttribute: blAttributeClass
	^ blAttributeClass ~= BLWidthParent and: [ blAttributeClass ~= BLEnable ]