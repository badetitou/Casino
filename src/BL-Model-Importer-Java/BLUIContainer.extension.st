Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Importer-Java' }
BLUIContainer >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	aWidget addingPosition: anInvocation sourceAnchor startPos.
	self addWidget: aWidget
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIContainer class >> defaultIfNotFoundFor: anInvocation [
	^ nil
]

{ #category : #'*BL-Model-Importer-Java' }
BLUIContainer >> postImport [
	super postImport.
	widgets := self widgets asOrderedCollection
		sort: [ :widget1 :widget2 | 
			widget1 addingPosition 
				< widget2 addingPosition  ]
]
