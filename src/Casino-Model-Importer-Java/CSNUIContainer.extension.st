Extension { #name : #CSNUIContainer }

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIContainer class >> defaultIfNotFoundFor: anInvocation [
	^ nil
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNUIContainer >> postImport [
	super postImport.
	widgets := self widgets asOrderedCollection
		sort: [ :widget1 :widget2 | 
			widget1 addingPosition 
				< widget2 addingPosition  ]
]
