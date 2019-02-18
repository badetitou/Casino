Extension { #name : #CSNCenterAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCenterAlignement >> angularHorizontalAlignement [
	^ 'p-justify-around'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCenterAlignement >> angularValue [
	^ 'text-align: center;'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCenterAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNEastAlignement new ]
				ifFalse: [ horizontal isNil
						ifTrue: [ nil ]
						ifFalse: [ self new ] ] ]
]
