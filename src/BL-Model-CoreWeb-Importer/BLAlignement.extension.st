Extension { #name : #BLAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLAlignement class >> createAlignementWithHorizontal: horizontal andVertical: vertical [
	^ vertical = 'HasVerticalAlignment.ALIGN_TOP'
		ifTrue: [ BLNorthAlignement new ]
		ifFalse: [ (vertical = 'HasVerticalAlignment.ALIGN_BOTTOM') ifTrue: [BLSouthAlignement new] ifFalse: [BLCenterAlignement new] ]
]
