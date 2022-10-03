Extension { #name : #CSNUICWCoreRowSpan }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWCoreRowSpan >> accept: aVisitor [
	^ aVisitor visitCSNUICWCoreRowSpan: self
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWCoreRowSpan >> name [
	^ 'rowspan'
]
