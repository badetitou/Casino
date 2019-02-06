Extension { #name : #CSNUILeaf }

{ #category : #'*Casino-Model-Query' }
CSNUILeaf >> accept: anExporter [
	^ anExporter visitUILeaf: self
]

{ #category : #'*Casino-Model-Query' }
CSNUILeaf >> outgoingElement [
	^ (self actions collect: #value)
]
