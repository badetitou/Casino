Extension { #name : #CSNSouthAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNSouthAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNSouthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNSouthEastAlignement new ]
				ifFalse: [ CSNSouthAlignement new ] ]
]
