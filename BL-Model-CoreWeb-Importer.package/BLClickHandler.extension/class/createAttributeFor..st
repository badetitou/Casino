*BL-Model-CoreWeb-Importer
createAttributeFor: aFAMIXClass
	^ (super createAttributeFor: aFAMIXClass)
		name: 'click';
		attributeValue: 'clickOn' , aFAMIXClass uniqueName;
		yourself