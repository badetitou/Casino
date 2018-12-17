Extension { #name : #BLUIRelativeWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeWidth class >> canHandle: anInvocation [
		^ (super canHandle: anInvocation)
		and: [ (self getAttributeValueFrom: anInvocation) endsWith: '%' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |
	attribute := super createAttributeFrom: anInvocation for: aWidgetInstance.
	attribute attributeValue: (attribute attributeValue removeSuffix: '%').
	^ attribute
]
