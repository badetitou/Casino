Extension { #name : #CSNBuBusinessType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuBusinessType >> dependencies [

	| deps |
	deps := (attributes collect: #attributeType) collect: [ :type | 
		        type isComplexType
			        ifFalse: [ type ]
			        ifTrue: [ 
				        type isCollectionType
					        ifTrue: [ type type ]
					        ifFalse: [ "dictionary type"
						        { 
							        type key.
							        type value } ] ] ].
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
CSNBuBusinessType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< self name
]
