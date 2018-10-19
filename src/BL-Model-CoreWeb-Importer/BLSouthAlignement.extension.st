Extension { #name : #BLSouthAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLSouthAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ BLSouthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ BLSouthEastAlignement new ]
				ifFalse: [ BLSouthAlignement new ] ]
]
