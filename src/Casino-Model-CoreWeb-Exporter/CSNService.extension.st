Extension { #name : #CSNService }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNService >> dependencies [
	^ (self actions flatCollect: #dependencies) asSet
]
