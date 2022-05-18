Extension { #name : #CSNBuBusinessType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> dependencies [

	| deps innerCollect |
	innerCollect := nil. "to get rid of warning"
	innerCollect := [ :type | 
	                type isComplexType
		                ifFalse: [ type ]
		                ifTrue: [ 
			                type isCollectionType
				                ifTrue: [ innerCollect value: type type ]
				                ifFalse: [ "dictionary type"
					                { 
						                (innerCollect value: type key).
						                (innerCollect value: type value) } ] ] ].
	deps := (attributes collect: #attributeType) collect: innerCollect.
	parent ifNotNil: [ deps add: parent ].
	deps addAll: children.
	deps := deps flattened asSet select: #isBusinessType.
	^ deps reject: [ :dep | dep = self ]
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
CSNBuBusinessType >> printServiceDeserializeOn: aCSNExporter [

	aCSNExporter <<< 'jsonParser.transform(res, ' inBraces: [ 
		aCSNExporter << 'mainCreator: () => ['.
		self printJsonClassTypeOn: aCSNExporter.
		aCSNExporter <<< ']' ].
	aCSNExporter <<< ')'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> printServiceSerializeOn: aCSNExporter named: aName [

	aCSNExporter <<< 'jsonStringifier.transform(' <<< aName <<< $)
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> sortedAttributes [

	^ attributes sorted: [ :a1 :a2 | 
		  (a1 source ifNil: 0 ifNotNil: [ :src | src sourceAnchor startPos ])
		  <
		  (a2 source ifNil: 0 ifNotNil: [ :src | src sourceAnchor startPos ]) ]
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< self name
]
