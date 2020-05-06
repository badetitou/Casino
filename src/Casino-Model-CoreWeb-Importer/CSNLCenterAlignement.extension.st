Extension { #name : #CSNLCenterAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLCenterAlignement >> angularHorizontalAlignement [
	^ 'p-justify-around'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLCenterAlignement >> angularValue [
	^ 'text-align: center;'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLCenterAlignement class >> generateWithHorizontal: horizontal [
	^ horizontal = 'HasHorizontalAlignment.ALIGN_LEFT'
		ifTrue: [ CSNLWestAlignement new ]
		ifFalse: [ horizontal = 'HasHorizontalAlignment.ALIGN_RIGHT'
				ifTrue: [ CSNLEastAlignement new ]
				ifFalse: [ horizontal ifNotNil: [ self new ] ] ]
]
