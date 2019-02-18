Extension { #name : #CSNUIHeight }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIHeight class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setHeight' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'height';
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
