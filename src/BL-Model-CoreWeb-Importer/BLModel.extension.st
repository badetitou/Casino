Extension { #name : #BLModel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLModel class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLModel class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'model';
		attributeValue: 'items';
		widget: aWidgetInstance;
		yourself

]
