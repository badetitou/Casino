Extension { #name : #CSNUICWCoreColSpan }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWCoreColSpan >> accept: aVisitor [
	^ aVisitor visitCSNUICWCoreColSpan: self
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWCoreColSpan >> isCellAttribute [
	^ true
]
