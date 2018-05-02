*BL-Model-Importer-Java
createAttributeFor: anInvocation
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself