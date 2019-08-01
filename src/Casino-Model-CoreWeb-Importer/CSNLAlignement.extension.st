Extension { #name : #CSNLAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLAlignement class >> createAlignementWithHorizontal: horizontal andVertical: vertical [
	^ vertical = 'HasVerticalAlignment.ALIGN_TOP'
		ifTrue: [ CSNLNorthAlignement generateWithHorizontal: horizontal ]
		ifFalse: [ vertical = 'HasVerticalAlignment.ALIGN_BOTTOM'
				ifTrue: [ CSNLSouthAlignement generateWithHorizontal: horizontal ]
				ifFalse: [ CSNLCenterAlignement generateWithHorizontal: horizontal ] ]
]
