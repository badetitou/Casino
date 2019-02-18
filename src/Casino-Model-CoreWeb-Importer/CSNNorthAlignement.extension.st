Extension { #name : #CSNNorthAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNNorthAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNNorthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNNorthEastAlignement new ]
				ifFalse: [ CSNNorthAlignement new ] ]
]
