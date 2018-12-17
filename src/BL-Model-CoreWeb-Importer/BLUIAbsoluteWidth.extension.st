Extension { #name : #BLUIAbsoluteWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteWidth class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ (self getAttributeValueFrom: anInvocation) endsWith: 'px' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |
	attribute := super createAttributeFrom: anInvocation for: aWidgetInstance.
	attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
	^ attribute
]
