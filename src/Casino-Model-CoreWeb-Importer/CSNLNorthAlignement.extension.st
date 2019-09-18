Extension { #name : #CSNLNorthAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLNorthAlignement classSide >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNLNorthWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNLNorthEastAlignement new ]
				ifFalse: [ CSNLNorthAlignement new ] ]
]
