*BL-Model-Importer-Java
attributeName
	^ (signature copyFrom: 4 to: ((signature findString: '(') - 1)) asLowercase.