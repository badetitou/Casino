Extension { #name : #BLUIRelativeHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeHeight class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ (self getAttributeValueFrom: anInvocation) endsWith: '%' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIRelativeHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |
	attribute := super createAttributeFrom: anInvocation for: aWidgetInstance.
	attribute attributeValue: (attribute attributeValue removeSuffix: '%').
	^ attribute
]
