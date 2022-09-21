Extension { #name : #FamixTNamedEntity }

{ #category : #'*Casino-Helper' }
FamixTNamedEntity >> csnFullName [
	^ String streamContents: [ :stream | self fullNameOn: stream ]
]

{ #category : #'*Casino-Helper' }
FamixTNamedEntity >> csnFullNameOn: stream [
	self flag: #todo.	"Manage case of multiple parents."
	self parents
		ifNotEmpty: [ :parents | 
			parents anyOne csnFullNameOn: stream.
			stream nextPut: $. ].
	stream nextPutAll: self name
]
