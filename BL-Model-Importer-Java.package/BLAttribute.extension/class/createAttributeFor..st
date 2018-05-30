*BL-Model-Importer-Java
createAttributeFor: anInvocation
	^ self new
		source: anInvocation ;
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself