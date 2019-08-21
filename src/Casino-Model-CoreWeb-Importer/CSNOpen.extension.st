Extension { #name : #CSNOpen }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNOpen class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'open' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNOpen class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself

]
