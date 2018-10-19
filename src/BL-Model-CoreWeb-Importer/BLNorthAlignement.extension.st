Extension { #name : #BLNorthAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLNorthAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ BLNorthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ BLNorthEastAlignement new ]
				ifFalse: [ BLNorthAlignement new ] ]
]
