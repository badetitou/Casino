*BL-Model-CoreWeb-Importer
createAttributeFor: anInvocation
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself