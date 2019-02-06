Extension { #name : #CSNUIAbsoluteWidth }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIAbsoluteWidth class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ (self getAttributeValueFrom: anInvocation) endsWith: 'px' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIAbsoluteWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |
	attribute := super createAttributeFrom: anInvocation for: aWidgetInstance.
	attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
	^ attribute
]
