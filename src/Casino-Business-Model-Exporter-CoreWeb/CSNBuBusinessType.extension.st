Extension { #name : #CSNBuBusinessType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> dependencies [
	^ ((((self attributes collect: #attributeType)
		collect: [ :type | 
			type isComplexType
				ifTrue: [ type isCollectionType
						ifTrue: [ type type ]
						ifFalse: [ {type key . type value} ] ]
				ifFalse: [ type ] ]) flattened select: #isBusinessType) asSet) reject: [ :dep | dep = self ]
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> innerName [
	^ self name
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> printJsonClassTypeOn: aCSNExporter [
	aCSNExporter <<< self name
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< self name
]
