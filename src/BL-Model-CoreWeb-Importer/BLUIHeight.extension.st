Extension { #name : #BLUIHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation signature beginsWith: 'setHeight' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]
