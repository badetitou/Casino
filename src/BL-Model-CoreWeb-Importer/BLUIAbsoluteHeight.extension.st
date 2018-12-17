Extension { #name : #BLUIAbsoluteHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteHeight class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ (self getAttributeValueFrom: anInvocation) endsWith: 'px' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIAbsoluteHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |	
		attribute :=  (super createAttributeFrom: anInvocation for: aWidgetInstance).
	attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
	^ attribute
]
