Extension { #name : #BLUILeaf }

{ #category : #'*BL-Model-Query' }
BLUILeaf >> accept: anExporter [
	^ anExporter visitBLUILeaf: self
]

{ #category : #'*BL-Model-Query' }
BLUILeaf >> outgoingElement [
	^ (self actionAppels collect: #value)
]
