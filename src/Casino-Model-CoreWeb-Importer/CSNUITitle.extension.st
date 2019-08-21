Extension { #name : #CSNUITitle }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUITitle class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setTitle' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUITitle class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
