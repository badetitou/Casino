Extension { #name : #CSNUIAbsoluteHeight }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIAbsoluteHeight class >> canHandle: anInvocation [
	^ (super canHandle: anInvocation) and: [ (self getAttributeValueFrom: anInvocation) endsWith: 'px' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIAbsoluteHeight class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	| attribute |	
		attribute :=  (super createAttributeFrom: anInvocation for: aWidgetInstance).
	attribute attributeValue: (attribute attributeValue removeSuffix: 'px').
	^ attribute
]
