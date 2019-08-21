Extension { #name : #CSNModel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNModel class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNModel class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		name: 'model';
		attributeValue: 'items';
		widget: aWidgetInstance;
		yourself

]
