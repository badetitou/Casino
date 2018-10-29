Extension { #name : #BLToggleable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLToggleable class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLToggleable class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'toggleable';
		attributeValue: 'true';
		widget: aWidgetInstance;
		yourself

]
