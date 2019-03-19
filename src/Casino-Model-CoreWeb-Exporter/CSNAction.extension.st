Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNAction >> importString [
	^ self behavior ifNotNil: [ :behaviors | behaviors flatCollect: #importString  ] ifNil: [ '' ]
]
