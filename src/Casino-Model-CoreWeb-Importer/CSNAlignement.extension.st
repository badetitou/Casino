Extension { #name : #CSNAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNAlignement classSide >> createAlignementWithHorizontal: horizontal andVertical: vertical [
	^ vertical = 'HasVerticalAlignment.ALIGN_TOP'
		ifTrue: [ CSNNorthAlignement generateWithHorizontal: horizontal ]
		ifFalse: [ vertical = 'HasVerticalAlignment.ALIGN_BOTTOM'
				ifTrue: [ CSNSouthAlignement generateWithHorizontal: horizontal ]
				ifFalse: [ CSNCenterAlignement generateWithHorizontal: horizontal ] ]
]
