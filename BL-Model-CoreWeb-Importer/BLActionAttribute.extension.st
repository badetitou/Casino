Extension { #name : #BLActionAttribute }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLActionAttribute class >> createAttributeFor: aFAMIXCLass [
	^ self new
		source: aFAMIXCLass;
		name: aFAMIXCLass name;
		attributeValue: aFAMIXCLass name;
		oldClass: aFAMIXCLass;
		yourself
]
