Extension { #name : #CSNUIWidth }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setWidth' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'width';
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
