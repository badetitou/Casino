Extension { #name : #BLClickHandler }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> canHandle: aFAMIXClass [
	^ aFAMIXClass isClass and: [ aFAMIXClass name includesSubstring: 'ClickHandler' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> createAttributeFrom: aFAMIXClass for: aWidgetInstance [
	^ (super createAttributeFrom: aFAMIXClass for: aWidgetInstance)
		name: 'click';
		attributeValue: 'clickOn' , aFAMIXClass uniqueName;
		widget: aWidgetInstance;
		yourself
]
