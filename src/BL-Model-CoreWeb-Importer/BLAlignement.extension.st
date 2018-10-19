Extension { #name : #BLAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLAlignement class >> createAlignementWithHorizontal: horizontal andVertical: vertical [
	^ vertical = 'HasVerticalAlignment.ALIGN_TOP'
		ifTrue: [ BLNorthAlignement generateWithHorizontal: horizontal ]
		ifFalse: [ vertical = 'HasVerticalAlignment.ALIGN_BOTTOM'
				ifTrue: [ BLSouthAlignement generateWithHorizontal: horizontal ]
				ifFalse: [ BLCenterAlignement generateWithHorizontal: horizontal ] ]
]
