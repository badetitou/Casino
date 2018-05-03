*BL-Model-CoreWeb-Importer
createAttributeFor: aFAMIXClass
	^ self new
		name: 'click';
		attributeValue: 'clickOn' , aFAMIXClass uniqueName , '()';
		oldMethod: (aFAMIXClass methods at: 1) sourceText;
		yourself