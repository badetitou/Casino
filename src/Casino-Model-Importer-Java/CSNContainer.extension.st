Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Importer-Java' }
CSNContainer >> postImport [
	super postImport.
	widgets := self widgets asOrderedCollection
		sort: [ :widget1 :widget2 | 
			widget1 addingPosition 
				< widget2 addingPosition  ]
]
