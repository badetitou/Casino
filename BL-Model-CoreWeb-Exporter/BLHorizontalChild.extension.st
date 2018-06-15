Extension { #name : #BLHorizontalChild }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLHorizontalChild >> attributeValue [
	^ 'ui-md-6 ui-lg-', self subpart asString
]
