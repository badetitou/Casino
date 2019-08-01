Extension { #name : #CSNLSouthAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLSouthAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNLSouthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNLSouthEastAlignement new ]
				ifFalse: [ CSNLSouthAlignement new ] ]
]
