Extension { #name : #BLLayout }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLLayout >> getLayoutAttribute [
	^ BLUIClass new attributeValue: 'p-grid'
]
