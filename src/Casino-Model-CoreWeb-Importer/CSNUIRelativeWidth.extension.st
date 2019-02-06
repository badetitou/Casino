Extension { #name : #CSNUIRelativeWidth }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIRelativeWidth class >> canHandle: anInvocation [
		^ (super canHandle: anInvocation)
		and: [ (self getAttributeValueFrom: anInvocation) endsWith: '%' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIRelativeWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |
	attribute := super createAttributeFrom: anInvocation for: aWidgetInstance.
	attribute attributeValue: (attribute attributeValue removeSuffix: '%').
	^ attribute
]
