Extension { #name : #BLHorizontalChild }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLHorizontalChild >> attributeValue [
	^ 'ui-g-', self subpart asString
]
