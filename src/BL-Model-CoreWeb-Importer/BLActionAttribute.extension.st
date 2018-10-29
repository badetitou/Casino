Extension { #name : #BLActionAttribute }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLActionAttribute class >> createAttributeFrom: aFAMIXCLass for: aWidgetInstance [
	^ self new
		source: aFAMIXCLass;
		name: aFAMIXCLass name;
		attributeValue: aFAMIXCLass name;
		oldClass: aFAMIXCLass;
		widget: aWidgetInstance;
		yourself
]
