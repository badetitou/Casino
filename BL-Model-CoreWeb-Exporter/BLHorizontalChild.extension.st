Extension { #name : #BLHorizontalChild }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLHorizontalChild >> attributeValue [
	^ 'ui-lg-', self subpart asString
]
