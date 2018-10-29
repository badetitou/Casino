Extension { #name : #BLUIWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'width' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		text: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
