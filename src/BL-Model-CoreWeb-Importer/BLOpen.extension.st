Extension { #name : #BLOpen }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLOpen class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'open' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLOpen class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself

]
