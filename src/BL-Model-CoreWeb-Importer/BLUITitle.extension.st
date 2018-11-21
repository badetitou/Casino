Extension { #name : #BLUITitle }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITitle class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setTitle' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITitle class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		text: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
