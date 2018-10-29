Extension { #name : #BLUIHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'height' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		text: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself

]
