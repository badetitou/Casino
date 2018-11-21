Extension { #name : #BLUIWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setWidth' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'width';
		text: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
