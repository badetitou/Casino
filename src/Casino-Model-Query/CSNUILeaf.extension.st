Extension { #name : #CSNUILeaf }

{ #category : #'*Casino-Model-Query' }
CSNUILeaf >> accept: anExporter [
	^ anExporter visitBLUILeaf: self
]

{ #category : #'*Casino-Model-Query' }
CSNUILeaf >> outgoingElement [
	^ (self actions collect: #value)
]
