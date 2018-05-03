*BL-Model-CoreWeb-Importer
createAttributeFor: aFAMIXClass
	^ self new
		name: 'click';
		attributeValue: 'clickOn' , aFAMIXClass uniqueName, '()';
		yourself