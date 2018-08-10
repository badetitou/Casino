Extension { #name : #BLClickHandler }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> canHandle: aFAMIXClass [
	^ aFAMIXClass isClass and: [ aFAMIXClass name includesSubstring: 'ClickHandler' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> createAttributeFor: aFAMIXClass [
	^ (super createAttributeFor: aFAMIXClass)
		name: 'click';
		attributeValue: 'clickOn' , aFAMIXClass uniqueName;
		yourself
]
